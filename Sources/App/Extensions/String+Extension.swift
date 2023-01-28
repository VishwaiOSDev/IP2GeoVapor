//
//  String+Extension.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import Foundation

extension String {
    
    func isIPv4() -> Bool {
        let regex = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        return self.range(of: regex, options: .regularExpression) != nil
    }
    
    func toBool() -> Bool {
        self.lowercased() == "success" ? true : false
    }
}
