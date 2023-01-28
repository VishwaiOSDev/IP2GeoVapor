//
//  GeoInfo.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import Foundation
import Vapor

struct IPApiInfo: Content {
    let status: String
    let country: String
    let countryCode: String
    let regionName: String
    let city: String
    let currency: String
    let query: String
}

struct GeoInfo: Content {
    let status: Bool
    let ip: String
    let country: String
    let countryCode: String
    let regionName: String
    let city: String
    let currency: String
    
    init(from ipApiInfo: IPApiInfo) {
        self.status = ipApiInfo.status.toBool()
        self.ip = ipApiInfo.query
        self.country = ipApiInfo.country
        self.countryCode = ipApiInfo.countryCode
        self.regionName = ipApiInfo.regionName
        self.city = ipApiInfo.city
        self.currency = ipApiInfo.currency
    }
}
