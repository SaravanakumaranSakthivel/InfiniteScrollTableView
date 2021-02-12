//
//  SATScoreDetailRequest.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 12/02/21.
//

import Foundation


internal struct SATScoreDetailRequest {
    
   internal static func executeRequest(_ endPoint: EndPoint, then handler: @escaping ([SATScoreDetailModel]?, NetworkError?) -> Void) {
        guard let url = endPoint.url else {
            return handler(nil, .invalidURL )
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(Configuration.app_token, forHTTPHeaderField: Configuration.app_token_key)
                            
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            if let error = error {
                handler(nil, .serverError(error: error))
            }
            
            let response = response as! HTTPURLResponse
            print("Response code -----", response.statusCode)
            
            guard let data = data else {
                handler(nil, .noData)
                return
            }
            
            do {
                let satScoreDetail = try JSONDecoder().decode([SATScoreDetailModel].self, from: data)
                handler(satScoreDetail, nil)
            } catch let parsingError {
                print("Error in parsing --- \(parsingError)")
                handler(nil, .parsingError)
            }
        }).resume()
    }
}
