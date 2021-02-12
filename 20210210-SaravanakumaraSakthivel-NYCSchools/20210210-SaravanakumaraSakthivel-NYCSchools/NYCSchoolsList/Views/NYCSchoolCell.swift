//
//  NYCSchoolCell.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 10/02/21.
//

import UIKit

/*
    This a cell used to display NYC schools name and address
    This uses "NYCSchoolCellViewModel" as model to set the values.
 */

class NYCSchoolCell: UITableViewCell {

    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var combinedAddressLabel : UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureView(_ cellViewModel: NYCSchoolCellViewModel) {
        if let scholName = cellViewModel.schoolName {
            self.schoolNameLabel.text = scholName
        }
        self.combinedAddressLabel.text = cellViewModel.combinedAddress
    }
    
}
