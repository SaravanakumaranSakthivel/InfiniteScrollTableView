//
//  NYCSchoolCellViewModel.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import Foundation

/*
    This is a view model used by the NYCSchoolCell. This has been constructed from the model. This will holds only the data that is required for the tableview cell.
 
        - schoolName - School's Name
        - phone_number - School's Phone number information
        - primary_address_line_1 - School's primary address line
        - city - School's city
        - zip - School's zip
        - state_code - School's state code
        - combinedAddress - This will combine concatenate "primary address" , "city" ,"zip" and "state code", if any of the information is not available it will return as 'n/a'
        
 **/


struct NYCSchoolCellViewModel {
    internal let schoolName : String?
    internal let primary_address_line_1: String?
    internal let city: String?
    internal let zip: String?
    internal let state_code: String?
    internal let phone_number: String?
    
    // This self declartive variable helps to construct Address by combining primaryAddress, city, state and zip
    internal var combinedAddress : String {
        let primaryAddress = self.primary_address_line_1 ?? "n/a"
        let city = self.city ?? "n/a"
        let state = self.state_code ?? "n/a"
        let zip = self.zip ?? "n/a"
        
        let combindedAddress = primaryAddress + "\n" + city + "\(", ")" + state + "\("-")" + zip
        return combindedAddress
    }

    // Initialize all the properties with model
    init(nycSchoolModel: NYCSchoolModel) {
        self.schoolName = nycSchoolModel.school_name
        self.primary_address_line_1 = nycSchoolModel.primary_address_line_1
        self.city = nycSchoolModel.city
        self.state_code = nycSchoolModel.state_code
        self.phone_number = nycSchoolModel.phone_number
        self.zip = nycSchoolModel.zip

    }
    
}
