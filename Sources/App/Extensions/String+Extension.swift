//
//  String+Extension.swift
//  
//
//  Created by Vishweshwaran on 28/01/23.
//

import Foundation

extension String {
    
    /// This function checks whether the string is a valid IPv4 address or not.
    /// - Returns: A Boolean value indicating whether the string is a valid IPv4 address (true) or not (false).
    func isIPv4() -> Bool {
        let regex = "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        return self.range(of: regex, options: .regularExpression) != nil
    }
    
    
    /// This function converts the string to a Boolean value.
    /// - Returns: A Boolean value indicating whether the string is "success" (true) or not (false).
    func toBool() -> Bool {
        self.lowercased() == "success" ? true : false
    }
}
