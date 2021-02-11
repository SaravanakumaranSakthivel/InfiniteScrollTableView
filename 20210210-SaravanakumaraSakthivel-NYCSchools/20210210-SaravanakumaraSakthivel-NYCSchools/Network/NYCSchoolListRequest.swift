//
//  NYCSchoolListRequest.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

internal class NYCSchoolListRequest : BaseRequest {
    
    internal var offsetParam: String
    
    internal init(offsetValue: Int) {
        self.offsetParam = "$offset=\(offsetValue)"
    }
    
    internal func path() -> String {
        Configuration.queryParam
    }
    
    func method() -> MethodType {
        .GET
    }
    
    internal func baseUrl() -> String {
        Configuration.baseUrl
    }
    
}
