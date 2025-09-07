//
//  FilterPageViewController.swift
//  BookingClone
//
//  Created by Work on 27/07/25.
//

import UIKit

struct SortByItem {
    let Name: String
    let Description: String
}

class FilterPageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    
    
    var sortByItems: [SortByItem] = [
        SortByItem(Name: "Price", Description: "High To Low"),
        SortByItem(Name: "Price", Description: "Low To High"),
        SortByItem(Name: "Rating", Description: "High To Low"),
        SortByItem(Name: "Rating", Description: "Low To High"),
        SortByItem(Name: "Top Reviewed", Description: ""),
        SortByItem(Name: "Distance", Description: "Near to Far"),
        SortByItem(Name: "Distance", Description: "Far to Near")
    ]

    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var filterTableview: UITableView!
    @IBOutlet weak var sortByFilter: UICollectionView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Selected text color
            let selectedTextAttributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: UIColor.white
            ]
        
                        segmentController.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        sortByFilter.delegate = self
        sortByFilter.dataSource = self
        
        filterTableview.delegate = self
        filterTableview.dataSource = self
        // Do any additional setup after loading the view.
        

        
        let nib2 = UINib(nibName: "SortByFilterPageCollectionViewCell", bundle: nil)
        sortByFilter.register(nib2, forCellWithReuseIdentifier: "SortByFilterPageCollectionViewCell")
        
        let nibTable = UINib(nibName: "BudgetRangeTableViewCell", bundle: nil)
        filterTableview.register(nibTable, forCellReuseIdentifier: "BudgetRangeTableViewCell")
        
        let nibTable2 = UINib(nibName: "RatingStarTableViewCell", bundle: nil)
        filterTableview.register(nibTable2, forCellReuseIdentifier: "RatingStarTableViewCell")
        
        let nibTable3 = UINib(nibName: "NumberOfBedTableViewCell", bundle: nil)
        filterTableview.register(nibTable3, forCellReuseIdentifier: "NumberOfBedTableViewCell")
        
        let nibTable4 = UINib(nibName: "TypeOfBedTableViewCell", bundle: nil)
        filterTableview.register(nibTable4, forCellReuseIdentifier: "TypeOfBedTableViewCell")
        
        let nibTable5 = UINib(nibName: "PropertyTypeTableViewCell", bundle: nil)
        filterTableview.register(nibTable5, forCellReuseIdentifier: "PropertyTypeTableViewCell")
        
        let nibTable6 = UINib(nibName: "facilitiesTableViewCell", bundle: nil)
        filterTableview.register(nibTable6, forCellReuseIdentifier: "facilitiesTableViewCell")
        
        let nibTable7 = UINib(nibName: "ApplyButtonTableViewCell", bundle: nil)
        filterTableview.register(nibTable7, forCellReuseIdentifier: "ApplyButtonTableViewCell")

        
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return sortByItems.count

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SortByFilterPageCollectionViewCell", for: indexPath) as! SortByFilterPageCollectionViewCell
        
        let item = sortByItems[indexPath.item]
        
        cell.sortNameLbl.text = item.Name
        cell.sortDescriptionLbl.text = item.Description
            
            return cell

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "BudgetRangeTableViewCell", for: indexPath) as! BudgetRangeTableViewCell
            
            return cell
        }else if indexPath.row == 1{
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "RatingStarTableViewCell", for: indexPath) as! RatingStarTableViewCell
            
    
            return cell
        }else if indexPath.row == 2{
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "NumberOfBedTableViewCell", for: indexPath) as! NumberOfBedTableViewCell
            
    
            return cell
        }else if indexPath.row == 3{
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "TypeOfBedTableViewCell", for: indexPath) as! TypeOfBedTableViewCell
            
    
            return cell
        }else if indexPath.row == 4 {
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "BudgetRangeTableViewCell", for: indexPath) as! BudgetRangeTableViewCell
            cell.isFromDistanceFilter = true
            cell.budgetLbl.text = "100 Km"
            cell.headingLabel.text = "Distance Range"
            return cell
        }else if indexPath.row == 5 {
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "PropertyTypeTableViewCell", for: indexPath) as! PropertyTypeTableViewCell
            
            return cell
        }else if indexPath.row == 6 {
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "facilitiesTableViewCell", for: indexPath) as! facilitiesTableViewCell
            
            return cell
        }else if indexPath.row == 7 {
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "ApplyButtonTableViewCell", for: indexPath) as! ApplyButtonTableViewCell
            cell.callbackHotel = {
                self.dismiss(animated: true)
            }
            
            return cell
        }else{
            let cell = filterTableview.dequeueReusableCell(withIdentifier: "BudgetRangeTableViewCell", for: indexPath) as! BudgetRangeTableViewCell
            
    
            return cell
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
