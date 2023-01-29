//
//  IP2GeoController.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import Vapor

final class IP2GeoController: RouteCollection {
    
    /// Enum ResponseType is used to specify the format of the response from the external IP-API service.
    /// The response can be in any of the following formats: json, xml, csv or newline.
    enum ResponseType: String {
        case json, xml, csv
        case newline = "line"
    }
    
    /// This function is used to register the route for IP2GeoController.
    /// It maps the route with the function that returns the GeoInfo object.
    /// - Parameters:
    ///     - routes: Vapor.RoutesBuilder, Route collection object
    /// - Throws: Error when there is an issue in registering the route
    func boot(routes: Vapor.RoutesBuilder) throws {
        /// This is a GET route that takes the IP address as a path parameter.
        /// The IP address is then passed to the getIpApiResponse function to get the IP-API response.
        /// The response is then converted to GeoInfo object and returned.
        routes.get("json", ":ipAddress") { req -> GeoInfo in
            // Check if the passed IP address is a valid IPv4 address
            guard let clientIP = req.parameters.get("ipAddress"), clientIP.isIPv4() else { throw Abort(.badRequest) }
            let ipApiInfo = try await self.getIpApiResponse(req, for: clientIP)
            let geoInfo = GeoInfo(from: ipApiInfo)
            return geoInfo
        }
    }
}

/// This extension is used to provide the functionality to get the IP-API response for the given IP address.
fileprivate extension IP2GeoController {
    
    /// This function is used to get the IP-API response for the given IP address.
    /// - Parameters
    ///    - req: Request, Vapor's Request object
    ///    - ip: String, IP address for which the IP-API response is needed
    ///    - responseType: ResponseType, format of the response (json, xml, csv or newline)
    /// - Returns: IPApiInfo, IP-API response for the given IP address
    /// - Throws: Error when there is an issue in getting the response from the IP-API service
    func getIpApiResponse(_ req: Request, for ip: String, responseType: ResponseType = .json) async throws -> IPApiInfo {
        let ipApiURL = getURI(for: ip, responseType)
        let response = try await req.client.get(ipApiURL)
        return try response.content.decode(IPApiInfo.self)
    }
    
    /// This function returns a URI object that can be used to make a request to the IP-API service.
    /// - Parameters:
    ///     - ip: The IP address to be queried.
    ///     - responseType: The type of response to be returned by the IP-API service.
    /// - Returns: A `URI` object that can be used to make a request to the IP-API service with the specified IP address and response type.
    func getURI(for ip: String, _ responseType: ResponseType) -> URI {
        var baseURL = URI()
        baseURL.scheme = "http"
        baseURL.path = "/\(responseType.rawValue)/\(ip)"
        baseURL.host = "ip-api.com"
        let parameters = ["fields": "status,currency,country,countryCode,regionName,city,query"]
        return baseURL.appendingQueryParameters(parameters)
    }
}
