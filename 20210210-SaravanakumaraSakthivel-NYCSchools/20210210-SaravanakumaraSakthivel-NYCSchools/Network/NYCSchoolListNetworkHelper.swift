//
//  NYCSchoolListNetworkHelper.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

struct NYCSchoolListNetworkHelper {
    
    internal func getNYCSchoolList(_ offset: Int) {
        let request = NYCSchoolListRequest(offsetValue: offset)
        let url = URL(string: request.baseUrl() + request.path() + request.offsetParam)
        
        let session = URLSession.shared
        session.
    }
}
