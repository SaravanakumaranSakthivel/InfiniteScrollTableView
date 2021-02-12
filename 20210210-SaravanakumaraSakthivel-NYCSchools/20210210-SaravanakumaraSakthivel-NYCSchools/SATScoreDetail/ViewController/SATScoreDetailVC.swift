//
//  SATScoreDetailVC.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 12/02/21.
//

import UIKit

class SATScoreDetailVC: UIViewController {
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var noSATTestTakerLabel: UILabel!
    @IBOutlet weak var satCriticalAvgReading: UILabel!
    @IBOutlet weak var satAvgMathScore: UILabel!
    @IBOutlet weak var satAvgWritingScore: UILabel!

    var schoolModel: NYCSchoolModel?
    var satScoreViewModel: SATScoreDetailVCViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSATScoreDetails()
    }
    
    func getSATScoreDetails() {
        guard let schoolModel = self.schoolModel,
              let dbn = schoolModel.dbn else {
            return
        }
        
        NetworkHelper.getSATDetail(for: dbn, handler: { satDetail in
            guard let satDetail = satDetail else {
                return
            }
            self.satScoreViewModel = SATScoreDetailVCViewModel(satDetail, collegeModel: schoolModel)
            
            DispatchQueue.main.async {
                self.updateUI()
            }
        })
    }
    
    func updateUI() {
        
        guard let satScoreVM = self.satScoreViewModel else {
            return
        }
        
        self.schoolNameLabel?.text = satScoreVM.school_name
        self.descriptionLabel?.text = satScoreVM.overview_paragraph
        self.noSATTestTakerLabel?.text = satScoreVM.num_of_sat_test_takers
        self.satCriticalAvgReading?.text = satScoreVM.sat_critical_reading_avg_score
        self.satAvgMathScore?.text = satScoreVM.sat_math_avg_score
        self.satAvgWritingScore?.text = satScoreVM.sat_writing_avg_score
    }


}
