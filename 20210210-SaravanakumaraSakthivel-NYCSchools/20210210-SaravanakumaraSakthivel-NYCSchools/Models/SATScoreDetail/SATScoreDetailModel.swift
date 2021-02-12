//
//  SATScoreDetailModel.swift
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

internal struct SATScoreDetailModel: Codable {
    internal let dbn : String
    internal let school_name: String
    internal let num_of_sat_test_takers: String
    internal let sat_critical_reading_avg_score: String
    internal let sat_math_avg_score: String
    internal let sat_writing_avg_score: String
}
