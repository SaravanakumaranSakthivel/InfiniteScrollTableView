//
//  ConfigurationTests.swift
//  20210210-SaravanakumaraSakthivel-NYCSchoolsTests
//
//  Created by SaravanaKumaran Sakthivel on 12/02/21.
//

import XCTest


class ConfigurationTests: XCTestCase {
    
    func checkHttpSchema () {
        XCTAssertEqual(Configuration.httpSchema, "https", "Http Schema should be https.")
    }
    
    func checkBaseURL () {
        XCTAssertEqual(Configuration.baseUrl, "data.cityofnewyork.us", "Base URL for the API calls are not mathing.")
    }
    
    func checkAppToken() {
        XCTAssertEqual(Configuration.app_token, "vMDXTk4mgdbXMDHLHHHkPHMER" , "Api token is not matching.")
    }
    
    func checkSchoolAPIPath() {
        XCTAssertEqual(Configuration.path, "/api/id/s3k6-pzi2.json" , "NYC Schools api path is not correct.")
    }
    
    func checkSATScorePath() {
        XCTAssertEqual(Configuration.satScorePath, "/resource/f9bf-2cp4.json" , "SAT Score paths is not correct.")
    }

}
