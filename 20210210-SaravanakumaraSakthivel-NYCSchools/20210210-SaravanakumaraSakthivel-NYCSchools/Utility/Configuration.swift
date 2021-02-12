//
//  Configuration.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/*
    This is struct holds all constant variables.
 */

struct Configuration {
    // Http Schema
    internal static let httpSchema = "https"
    
    // Base URL
    internal static let baseUrl = "data.cityofnewyork.us"
    
    // Generated App token
    internal static let app_token = "vMDXTk4mgdbXMDHLHHHkPHMER"
    internal static let app_token_key = "X-App-Token"
    
    // NYC school list Path and Query
    internal static let path = "/api/id/s3k6-pzi2.json"
    internal static let selectQuery = "$select"
    internal static let selectQueryValue =  "`dbn`,`school_name`,`overview_paragraph`,`website`,`phone_number`,`fax_number`,`school_email`,`primary_address_line_1`,`city`,`zip`,`state_code`"
    internal static let limitQuery = "$limit"
    internal static let offsetQuer = "$offset"
    
    // SAT Score
    internal static let satScorePath = "/resource/f9bf-2cp4.json"
    internal static let satScoreQuery = "dbn"
    
}


