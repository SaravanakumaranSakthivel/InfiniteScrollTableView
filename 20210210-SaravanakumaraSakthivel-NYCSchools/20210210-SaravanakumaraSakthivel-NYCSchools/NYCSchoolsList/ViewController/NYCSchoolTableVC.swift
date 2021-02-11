//
//  NYCSchoolTableVC.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import UIKit

class NYCSchoolTableVC: UITableViewController {
    
    var isLoading = false
    var dataSource = [1,2,3,4,5,6,7,8,9,10]


    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    internal func configureTableView() {
        //Register Loading Cell
        let tableViewLoadingCellNib = UINib(nibName: "NYCLoadingCell", bundle: nil)
        self.tableView.register(tableViewLoadingCellNib, forCellReuseIdentifier: "loadingcellid")
        
        //Register school Cell
        let schoolCell = UINib(nibName: "NYCSchoolCell", bundle: nil)
        self.tableView.register(schoolCell, forCellReuseIdentifier: "schoolcellidentifier")
    }

}

extension NYCSchoolTableVC {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            //Return the amount of datasource
            return dataSource.count
        } else if section == 1 {
            //Return the Loading cell
            return 1
        }
        //Return nothing
        return 0
    }
    
    override  func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "schoolcellidentifier", for: indexPath) as! NYCSchoolCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingcellid", for: indexPath) as! NYCLoadingCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height

            if (offsetY > contentHeight - scrollView.frame.height * 4) && !isLoading {
                loadMoreData()
            }
        }
    
    func loadMoreData() {
            if !self.isLoading {
                self.isLoading = true
                DispatchQueue.global().async {
                    // Fake background loading task for 2 seconds
                    sleep(2)
                    // Download more data here
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.isLoading = false
                    }
                }
            }
        }

}
