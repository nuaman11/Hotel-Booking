//
//  HotelListViewController.swift
//  BookingClone
//
//  Created by Work on 17/07/25.
//

import UIKit

struct HotelItem {
    let title: String
    let image: UIImage
}

class HotelListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var hotelItems: [HotelItem] = [
        HotelItem(title: "Queens Hotel", image: UIImage(named: "bed1")!),
        HotelItem(title: "Rose Hotel", image: UIImage(named: "bed2")!),
        HotelItem(title: "Sea queen Hotel", image: UIImage(named: "bed3")!),
        HotelItem(title: "Grand Hayatt", image: UIImage(named: "bed4")!),
        HotelItem(title: "Raviz Hotel", image: UIImage(named: "bed5")!)
    ]

    @IBOutlet weak var hotelListTable: UITableView!
    @IBOutlet weak var showMapsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        hotelListTable.dataSource = self
        hotelListTable.delegate = self
        
        let nibTable = UINib(nibName: "HotelListTableViewCell", bundle: nil)
        hotelListTable.register(nibTable, forCellReuseIdentifier: "HotelListTableViewCell")
        
        showMapsView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showMapViewTapped))
        showMapsView.addGestureRecognizer(tapGesture)
        showMapsView.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showFilterPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let mapVC = storyboard.instantiateViewController(withIdentifier: "FilterPageViewController") as? FilterPageViewController {
                mapVC.modalPresentationStyle = .fullScreen // or .pageSheet, .formSheet, etc.
                self.present(mapVC, animated: true, completion: nil)
            }
    }
    
    
    @objc func showMapViewTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let mapVC = storyboard.instantiateViewController(withIdentifier: "GoogleMapsViewController") as? GoogleMapsViewController {
                mapVC.modalPresentationStyle = .fullScreen // or .pageSheet, .formSheet, etc.
                self.present(mapVC, animated: true, completion: nil)
            }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = hotelListTable.dequeueReusableCell(withIdentifier: "HotelListTableViewCell", for: indexPath) as! HotelListTableViewCell

        cell.hotelImage.image = hotelItems[indexPath.row].image
        cell.hotelLbl.text = hotelItems[indexPath.row].title
        
           return cell
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        dismiss(animated: true)
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
