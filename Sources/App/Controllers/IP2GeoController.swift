//
//  IP2GeoController.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import Vapor

final class IP2GeoController: RouteCollection {
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        routes.get("json", ":ipAddress") { req -> GeoInfo in
            guard let clientIP = req.parameters.get("ipAddress"), clientIP.isIPv4() else { throw Abort(.badRequest) }
            let response = try await req.client.get("http://ip-api.com/json/\(clientIP)?fields=status,currency,country,countryCode,regionName,city,query")
            let geoInfo = GeoInfo(from: try response.content.decode(IPApiInfo.self))
            return geoInfo
        }
    }
}

extension String {
    
    func isIPv4() -> Bool {
        let regex = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        return self.range(of: regex, options: .regularExpression) != nil
    }
    
    func toBool() -> Bool {
        self.lowercased() == "success" ? true : false
    }
}
