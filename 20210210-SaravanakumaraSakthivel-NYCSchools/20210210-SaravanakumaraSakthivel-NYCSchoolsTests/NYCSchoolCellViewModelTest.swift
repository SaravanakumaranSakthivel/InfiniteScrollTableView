//
//  NYCSchoolCellViewModelTest.swift
//  20210210-SaravanakumaraSakthivel-NYCSchoolsTests
//
//  Created by SaravanaKumaran Sakthivel on 12/02/21.
//

import XCTest

class NYCSchoolCellViewModelTest: XCTestCase {
    var nycSchoolModel: NYCSchoolModel!
    
    override func setUp() {
        nycSchoolModel = NYCSchoolModel(dbn: "1234", school_name: "New York High School", overview_paragraph: "This is gives detail overview about the school", website: "www.nychighschool.com", phone_number: "2345679877", fax_number: "2345679877", school_email: "nychighschool@nyc.com", primary_address_line_1: "123 N Hight St", city: "New York", zip: "23456", state_code: "NY")
    }
    
    override func tearDown() {
        super.tearDown()
        self.nycSchoolModel = nil
    }
    
    func testCombinedAddressWithValidField() {
        let nycSchoolViewModel = NYCSchoolCellViewModel(nycSchoolModel: self.nycSchoolModel)
        let cominedAddress = nycSchoolViewModel.combinedAddress
        
        XCTAssertEqual(cominedAddress, "123 N Hight St\nNew York, NY-23456", "Combined address not retunring in expected format")
    }
    
    func testNilPrimaryAddressInCombinedAddress() {
        self.nycSchoolModel = NYCSchoolModel(dbn: "1234", school_name: "New York High School", overview_paragraph: "This is gives detail overview about the school", website: "www.nychighschool.com", phone_number: "2345679877", fax_number: "2345679877", school_email: "nychighschool@nyc.com", primary_address_line_1: nil, city: "New York", zip: "23456", state_code: "NY")
        let nycSchoolViewModel = NYCSchoolCellViewModel(nycSchoolModel: self.nycSchoolModel)
        XCTAssertEqual(nycSchoolViewModel.combinedAddress, "n/a\nNew York, NY-23456", "Nil primary address not updated with n/a")
    }

    
    func testOtherProperties() {
        let nycSchoolViewModel = NYCSchoolCellViewModel(nycSchoolModel: self.nycSchoolModel)

        XCTAssertEqual(nycSchoolViewModel.schoolName, self.nycSchoolModel.school_name, "School names are not matching")
        XCTAssertEqual(nycSchoolViewModel.city, self.nycSchoolModel.city, "city are not matching")
        XCTAssertEqual(nycSchoolViewModel.phone_number, self.nycSchoolModel.phone_number, "Phone numbers are not matching")
        XCTAssertEqual(nycSchoolViewModel.state_code, self.nycSchoolModel.state_code, "State Codes are not matching")
        XCTAssertEqual(nycSchoolViewModel.zip, self.nycSchoolModel.zip, "Zip Codes are not matching")
    }
    
    
    func testAllPropertiesWithNil() {
        self.nycSchoolModel = NYCSchoolModel(dbn: "1234", school_name: nil, overview_paragraph: nil, website: nil, phone_number: nil, fax_number: nil, school_email: nil, primary_address_line_1: nil, city: nil, zip: nil, state_code: nil)
        
        let nycSchoolViewModel = NYCSchoolCellViewModel(nycSchoolModel: self.nycSchoolModel)

        XCTAssertNil(nycSchoolViewModel.schoolName,  "School names should return nil")
        XCTAssertNil(nycSchoolViewModel.city, "city should return nil")
        XCTAssertNil(nycSchoolViewModel.phone_number, "Phone numbers should return nil")
        XCTAssertNil(nycSchoolViewModel.state_code, "State Codes should return nil")
        XCTAssertNil(nycSchoolViewModel.zip, "Zip Codes should return nil")
    }
    

}
