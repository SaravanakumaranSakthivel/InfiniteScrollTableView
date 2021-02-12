//
//  NYCSchoolListNetworkHelper.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/*
    Purpose of this Helper is to abstract how the data is fetched and network call url constructions and the place from where its getting the data.
 
    Improvements : Design a caching mechanism and fetch the data from cache, if the data is not present in cache we can make a service call to get a data.
 **/

struct NetworkHelper {
   
    internal static func getNYCSchoolList(_ offset: String, handler: @escaping(([NYCSchoolModel]?) ->Void)) {
        
        let endPoint = EndPoint.getNYCSchoolEndPoint(for: offset)
            NYCSchoolListRequest.executeRequest(endPoint,
                                            then:{ responseArr, Error in
                                                handler(responseArr)
        })
    }
    
    internal static func getSATDetail(for schoolDbn: String, handler: @escaping((SATScoreDetailModel?) -> Void)) {
        let endPoint = EndPoint.getSATScoreEndPoint(for: schoolDbn)
        SATScoreDetailRequest.executeRequest(endPoint,
                                             then: { response, Error in
                                                if let responseArr = response{
                                                    handler(responseArr.first)
                                                }
        })
    }
   
}
