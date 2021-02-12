//
//  SATScoreDetailVCViewModelTest.swift
//  20210210-SaravanakumaraSakthivel-NYCSchoolsTests
//
//  Created by SaravanaKumaran Sakthivel on 12/02/21.
//

import XCTest

class SATScoreDetailVCViewModelTest: XCTestCase {
    var nycSchoolModel: NYCSchoolModel!
    var satScoreDetailModel : SATScoreDetailModel!

    override func setUp() {
        self.nycSchoolModel = NYCSchoolModel(dbn: "1234",
                                        school_name: "New York High School",
                                        overview_paragraph: "This is gives detail overview about the school",
                                        website: "www.nychighschool.com",
                                        phone_number: "2345679877",
                                        fax_number: "2345679877",
                                        school_email: "nychighschool@nyc.com",
                                        primary_address_line_1: "123 N Hight St",
                                        city: "New York",
                                        zip: "23456",
                                        state_code: "NY")
        
        satScoreDetailModel = SATScoreDetailModel(dbn: "1234",
                                                  school_name: "New York High School",
                                                  num_of_sat_test_takers: "400",
                                                  sat_critical_reading_avg_score: "256",
                                                  sat_math_avg_score: "456",
                                                  sat_writing_avg_score: "455")
        
    }
    
    override func tearDown() {
        super.tearDown()
        self.nycSchoolModel = nil
        self.satScoreDetailModel = nil
    }
    
    func testSATScoreViewModel() {
        let satScoreVM = SATScoreDetailVCViewModel(self.satScoreDetailModel, collegeModel: self.nycSchoolModel)
        
        XCTAssertEqual(satScoreVM.school_name, self.satScoreDetailModel.school_name,
                       "School name is not matched with model")
        XCTAssertEqual(satScoreVM.num_of_sat_test_takers, "Total number of SAT Test Takers\n400",
                       "Number of SAT test takers are not matched with model")
        XCTAssertEqual(satScoreVM.sat_math_avg_score, "SAT Math Avg. score\n456",
                       "School math avg score is not matched with model")
        XCTAssertEqual(satScoreVM.sat_writing_avg_score, "SAT Writing Avg.Score\n455",
                       "School avg writing score is not matched with model")
        XCTAssertEqual(satScoreVM.sat_critical_reading_avg_score, "SAT Critical reading Avg. score\n256",
                       "Critical avg score is not matched with model")
        XCTAssertEqual(satScoreVM.overview_paragraph, self.nycSchoolModel.overview_paragraph,
                       "Overview paragraph is not matched with model")

    }
    
    func testSATScoreViewModelwithNilValue() {
        self.nycSchoolModel = NYCSchoolModel(dbn: "1234",
                                        school_name: "New York High School",
                                        overview_paragraph: nil,
                                        website: "www.nychighschool.com",
                                        phone_number: "2345679877",
                                        fax_number: "2345679877",
                                        school_email: "nychighschool@nyc.com",
                                        primary_address_line_1: "123 N Hight St",
                                        city: "New York",
                                        zip: "23456",
                                        state_code: "NY")
        
        satScoreDetailModel = SATScoreDetailModel(dbn: "1234",
                                                  school_name: nil,
                                                  num_of_sat_test_takers: nil,
                                                  sat_critical_reading_avg_score: nil,
                                                  sat_math_avg_score: nil,
                                                  sat_writing_avg_score: nil)
        let satScoreVM = SATScoreDetailVCViewModel(self.satScoreDetailModel, collegeModel: self.nycSchoolModel)

        XCTAssertNil(satScoreVM.school_name,
                       "School name should return nil")
        XCTAssertEqual(satScoreVM.num_of_sat_test_takers, "Total number of SAT Test Takers\nn/a",
                       "Number of SAT test takers should return n/a")
        XCTAssertEqual(satScoreVM.sat_math_avg_score, "SAT Math Avg. score\nn/a",
                       "School math avg score should return n/a")
        XCTAssertEqual(satScoreVM.sat_writing_avg_score, "SAT Writing Avg.Score\nn/a",
                       "School avg writing score should return n/a")
        XCTAssertEqual(satScoreVM.sat_critical_reading_avg_score, "SAT Critical reading Avg. score\nn/a",
                       "Critical avg score should return n/a")
        XCTAssertEqual(satScoreVM.overview_paragraph, self.nycSchoolModel.overview_paragraph,
                       "Overview paragraph should return n/a")
        
    }

}
