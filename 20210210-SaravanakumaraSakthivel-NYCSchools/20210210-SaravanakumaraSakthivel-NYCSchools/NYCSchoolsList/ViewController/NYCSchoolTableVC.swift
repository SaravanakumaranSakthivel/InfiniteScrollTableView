//
//  NYCSchoolTableVC.swift
//  20210210-SaravanakumaraSakthivel-NYCSchools
//
//  Created by SaravanaKumaran Sakthivel on 11/02/21.
//

import UIKit

/*
    This is the table view controller to list all NYC Schools.
    We are loading 10 records at a time when we scorll up we will loading next set of 10 records along with the existing data.
 **/


class NYCSchoolTableVC: UITableViewController {
    
    var isLoading = false
    var dataSource = [NYCSchoolModel]()


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
        
        self.fetchSchoolData()
       
    }
    
    internal func fetchSchoolData() {
        let currentCount = String(self.dataSource.count + 1)
        NYCSchoolListNetworkHelper.getNYCSchoolList(currentCount, handler: { response in
            guard let response = response else {
                return
            }
            
            self.dataSource = self.dataSource + response
            self.loadTableview()
        })
    }
    
    internal func loadTableview() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    override  func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "schoolcellidentifier", for: indexPath) as! NYCSchoolCell
            let schoolModel = self.dataSource[indexPath.row]
            let cellViewModel = NYCSchoolCellViewModel(nycSchoolModel: schoolModel)
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .none
            cell.configureView(cellViewModel)
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
    
    /*
        This method helps to fetch next set of data when we do swipe up
     **/
    func loadMoreData() {
            if !self.isLoading {
                self.isLoading = true
                DispatchQueue.global().async {
                    // Fake background loading task for 2 seconds
                    sleep(2)
                    // Download more data here
                    self.fetchSchoolData()
                    self.isLoading = false
                }
            }
        }

}
