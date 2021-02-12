//
//  NYCSchoolsModel.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/* This a model for the NYC School, Fetching only following values from the backend
    - dbn
    - school_name - School's Name
    - overview_paragraph - Short paragraph about the school
    - website - School's web site address
    - phone_number - School's Phone number information
    - fax_number - School's fax number
    - school_email - School's email address
    - primary_address_line_1 - School's primary address line
    - city - School's city
    - zip - School's zip
    - state_code - School's state code
    
    This Model conforms Codable protocol to decode JSON response to Model object. 
 **/

internal struct NYCSchoolModel: Codable {
    internal var dbn: String?
    internal var school_name: String?
    internal var overview_paragraph: String?
    internal var website: String?
    internal var phone_number: String?
    internal var fax_number: String?
    internal var school_email: String?
    internal var primary_address_line_1: String?
    internal var city: String?
    internal var zip: String?
    internal var state_code: String?
}
