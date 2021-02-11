//
//  BaseRequest.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/*
    This protocol defines a base request structure.
 */
protocol BaseRequest {
    
    // Method to define a path
    func path() -> String
    
    // Method to Setup base url
    func baseUrl() -> String
    
    // Method to setup header
    func header() -> [String : String]
    
    // Method to define
    func method() -> MethodType
    
}

extension BaseRequest {
    func header() -> [String: String] {
        return [Configuration.app_token_key: Configuration.app_token]
    }
    
}

enum MethodType: String {
    case GET
    case POST
    case PUT
}
