//
//  SATScoreDetailVCViewModel.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 12/02/21.
//

import Foundation


/* This a model for the SAT Score, below are the data we get from the backend.
    - dbn
    - school_name - School's Name
    - num_of_sat_test_takers - overall students who took the test
    - sat_critical_reading_avg_score - Students avg SAT Critical reading scroe
    - sat_math_avg_score - Students avg on SAT math scroe
    - sat_writing_avg_score - Students avg on SAT writing scroe
    
    This Model conforms Codable protocol to decode JSON response to Model object.
 **/

internal struct SATScoreDetailVCViewModel: Codable {
    internal let dbn : String?
    internal let school_name: String?
    internal let num_of_sat_test_takers: String?
    internal let sat_critical_reading_avg_score: String?
    internal let sat_math_avg_score: String?
    internal let sat_writing_avg_score: String?
    internal let overview_paragraph: String?
    
    init(_ satScoreDetail: SATScoreDetailModel, collegeModel: NYCSchoolModel) {
        self.dbn = satScoreDetail.dbn
        self.school_name = satScoreDetail.school_name
        
        self.num_of_sat_test_takers = "Total number of SAT Test Takers\n" + satScoreDetail.num_of_sat_test_takers
        self.sat_critical_reading_avg_score = "SAT Critical reading Avg. score\n" + satScoreDetail.sat_critical_reading_avg_score
        self.sat_math_avg_score = "SAT Math Avg. score\n" + satScoreDetail.sat_math_avg_score
        self.sat_writing_avg_score = "SAT Writing Avg.Score\n" + satScoreDetail.sat_writing_avg_score
        self.overview_paragraph = collegeModel.overview_paragraph
    }
}
