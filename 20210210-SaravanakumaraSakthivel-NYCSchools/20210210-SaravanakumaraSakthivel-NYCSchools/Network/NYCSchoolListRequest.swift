//
//  NYCSchoolListRequest.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/*
    - This is a helps to make a URL session to fetch list of NYC schools list from the backend service.
    - This check for response error and return parsed array of 'NYCSchoolModel' if the data returned from server.
    - If there is error happen in service call or parsing, callback handler will return Network error.
 
    Improvements :
    - Understand different status code and return status code specific error.
    Current implementation only checks for no data, service error and parser error.
 
    - At this time we are not checking network avilablity. 
 
 **/

internal struct NYCSchoolListRequest {
    
   internal static func executeRequest(_ endPoint: EndPoint, then handler: @escaping ([NYCSchoolModel]?, NetworkError?) -> Void) {
        guard let url = endPoint.url else {
            return handler(nil, .invalidURL )
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(Configuration.app_token, forHTTPHeaderField: Configuration.app_token_key)
                            
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error = error {
                handler(nil, .serverError(error: error))
            }
            
            guard let data = data else {
                handler(nil, .noData)
                return
            }
            
            do {
                let schools = try JSONDecoder().decode([NYCSchoolModel].self, from: data)
                handler(schools, nil)
            } catch let parsingError {
                print("Error in parsing --- \(parsingError)")
                handler(nil, .parsingError)
            }
        }).resume()
    }
}


/*
    This is an enum to group all network error and json parsing error.
    - invalidURL - indicates the constructed URL is not correct
    - serverError - This indicates the error return by server and it all also carries error paramter.
    - noData - Service call happened and for some reason if data is not present this type will be returned.
    - parsingError - If there is an error occured while parsing this will be returned
    
    Improvements : We can define other errors and seperate networks errors as different enum and parser errors as another enum group to give a clarity on what is realy failing.
 */
public enum NetworkError: Error {
    case invalidURL
    case serverError(error: Error?)
    case noData
    case parsingError
}
