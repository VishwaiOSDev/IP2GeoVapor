//
//  IP2GeoController.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import Vapor

final class IP2GeoController: RouteCollection {
    
    enum ResponseType: String {
        case json, xml, csv
        case newline = "line"
    }
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("json", ":ipAddress") { req -> GeoInfo in
            guard let clientIP = req.parameters.get("ipAddress"), clientIP.isIPv4() else { throw Abort(.badRequest) }
            let ipApiInfo = try await self.getIpApiResponse(req, for: clientIP)
            let geoInfo = GeoInfo(from: ipApiInfo)
            return geoInfo
        }
    }
}

fileprivate extension IP2GeoController {
    
    func getIpApiResponse(_ req: Request, for ip: String, responseType: ResponseType = .json) async throws -> IPApiInfo {
        let fields = "status,currency,country,countryCode,regionName,city,query"
        let ipApiURL =  URI(string: "http://ip-api.com/\(responseType.rawValue)/\(ip)?fields=\(fields)")
        let response = try await req.client.get(ipApiURL)
        return try response.content.decode(IPApiInfo.self)
    }
}
