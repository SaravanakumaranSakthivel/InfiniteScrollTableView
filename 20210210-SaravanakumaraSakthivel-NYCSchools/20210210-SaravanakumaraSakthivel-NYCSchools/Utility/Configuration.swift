//
//  Configuration.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

struct Configuration {
    internal static let baseUrl = "https://data.cityofnewyork.us/api/id/s3k6-pzi2.json?"
    internal static let queryParam = "$select=`dbn`,`school_name`,`overview_paragraph`,`website`,`phone_number`,`fax_number`,'school_email','primary_address_line_1','city','zip','state_code'&$order=`:id`+ASC&$limit=15&$offset=10"
    internal static let app_token = "vMDXTk4mgdbXMDHLHHHkPHMER"
    internal static let app_token_key = "X-App-Token"
}


