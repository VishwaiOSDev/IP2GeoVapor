//
//  URI+Extension.swift
//  
//
//  Created by Vishweshwaran on 29/01/23.
//

import Foundation
import Vapor

extension URI {
    
    func appendingQueryParameters(_ parameters: [String: String]) -> URI {
        let allParameters = mergeParameters(queryParameters(fromQuery: query), rhs: parameters)
        let newQuery = toQuery(parameters: allParameters)
        
        return URI(
            scheme: scheme,
            host: host,
            path: path,
            query: newQuery
        )
    }
    
    private func toQuery(parameters: [String: String]) -> String {
        let joined = parameters.reduce("", { result, next in
            return result + next.0 + "=" + next.1 + "&"
        })
        
        return String(joined[joined.startIndex..<joined.index(before: joined.endIndex)])
    }
    
    private func queryParameters(fromQuery query: String?) -> [String: String] {
        var params = [String: String]()
        guard let query = query else { return params }
        
        let comps = query.components(separatedBy: "&").reversed()
        comps.forEach { str in
            let expr = str.components(separatedBy: "=")
            params[expr[0]] = expr[1]
        }
        
        return params
    }
    
    private func mergeParameters(
        _ lhs: [String: String],
        rhs: [String: String]
    ) -> [String: String] {
        var res = lhs
        
        for (k, v) in rhs {
            res[k] = v
        }
        
        return res
    }
}

