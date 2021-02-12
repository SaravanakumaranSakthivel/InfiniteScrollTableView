//
//  EndPoint.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/*
    This is an basic structure to define a Endpoint.
 */

struct EndPoint {
    let path: String
    let queryItems: [URLQueryItem]
}

/*
    This extension contains 'getNYCSchoolEndPoint' static method and this method will accept below parameters as input parameter and return Endpoint
=        - offset - This helps to define offset record count from where the data needs to fetched.
 */

extension EndPoint {
    static func getNYCSchoolEndPoint(for offset:String) -> EndPoint {
        return EndPoint(path: Configuration.path,
                        queryItems: [URLQueryItem(name: Configuration.selectQuery, value: Configuration.selectQueryValue),
                                     URLQueryItem(name: Configuration.limitQuery, value: "10"),
                                     URLQueryItem(name: Configuration.offsetQuer, value: offset)]
        )
    }
    
    static func getSATScoreEndPoint(for schoolDbn: String) -> EndPoint {
        return EndPoint(path: Configuration.satScorePath,
                        queryItems: [URLQueryItem(name: Configuration.satScoreQuery, value: schoolDbn)])
    }
}

extension EndPoint {
    // We still have to keep 'url' as an optional, since we're
    // dealing with dynamic components that could be invalid.
    var url: URL? {
        var components = URLComponents()
        components.scheme = Configuration.httpSchema
        components.host = Configuration.baseUrl
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
