//
//  HomePageViewController.swift
//  BookingClone
//
//  Created by Work on 30/06/25.
//

import UIKit
import Kingfisher

struct TopItem {
    let title: String
    let image: UIImage
}

class HomePageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {

    var topItems: [TopItem] = [
        TopItem(title: "Stays", image: UIImage(named: "single-bed")!),
        TopItem(title: "Flights", image: UIImage(named: "airplane")!),
        TopItem(title: "Car Rental", image: UIImage(named: "sedan")!),
        TopItem(title: "Taxi", image: UIImage(named: "taxi")!),
        TopItem(title: "Attractions", image: UIImage(named: "hotel")!)
    ]

    @IBOutlet weak var tableViewHotels: UITableView!
    @IBOutlet weak var logoImageBanner: UIImageView!
    @IBOutlet weak var TopCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TopCollectionView.dataSource = self
        TopCollectionView.delegate = self
        
        tableViewHotels.dataSource = self
        tableViewHotels.delegate = self
        
        // Do any additional setup after loading the view.
        let nib = UINib(nibName: "TopCollectionViewCell", bundle: nil)
        TopCollectionView.register(nib, forCellWithReuseIdentifier: "TopCell")
    
        let nibTable = UINib(nibName: "HotelTableViewCell", bundle: nil)
        tableViewHotels.register(nibTable, forCellReuseIdentifier: "HotelCell")
        
        let nibTable2 = UINib(nibName: "BannerTableViewCell", bundle: nil)
        tableViewHotels.register(nibTable2, forCellReuseIdentifier: "BannerCell")
    }
    
    func openHoteList(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "HotelListViewController" ) as! HotelListViewController
        viewcontroller.modalPresentationStyle = .overFullScreen
        self.present(viewcontroller, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCollectionViewCell

           let item = topItems[indexPath.item]
           cell.titleLabel.text = item.title
           cell.imageView.image = item.image
        cell.holderView.layer.cornerRadius = 10
        cell.holderView.layer.borderWidth = 1
        cell.holderView.layer.borderColor = UIColor.black.cgColor
        cell.holderView.clipsToBounds = true
        
           return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableViewHotels.dequeueReusableCell(withIdentifier: "HotelCell", for: indexPath) as! HotelTableViewCell
            
            return cell
        }else if indexPath.row == 1{
            // add new image cells
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerTableViewCell

//            let images = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!] // example
//            cell.configure(with: images)
            cell.cellname == "imageCell"
            if indexPath.row == 1{
                cell.headingLbl.text = "Nearby Properties List"
            }else{
                cell.headingLbl.text = "Top Rated Properties List"
            }
            
            cell.callbackHotel = {
                self.openHoteList()
            }
            return cell
        }else if indexPath.row == 2{
            // add new image cells
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerTableViewCell

//            let images = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!] // example
//            cell.configure(with: images)
            cell.cellname == "imageCell"
            if indexPath.row == 1{
                cell.headingLbl.text = "Nearby Properties List"
            }else{
                cell.headingLbl.text = "Top Rated Properties List"
            }
            
            cell.callbackHotel = {
                self.openHoteList()
            }
            return cell
        }
//        else if indexPath.row == 1{
//            let cell = tableViewHotels.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerTableViewCell
//
////            let images = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!] // example
////            cell.configure(with: images)
//            cell.cellname = "offerCell"
//            cell.callbackHotel = {
//                self.openHoteList()
//            }
//            
//            return cell
//        }
        else{
                        let cell = tableViewHotels.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as! BannerTableViewCell
            
            //            let images = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!] // example
            //            cell.configure(with: images)
                        cell.cellname = "offerCell"
                        cell.callbackHotel = {
                            self.openHoteList()
                        }
            
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


extension UITextField{
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            // if you want subviews clipped to the rounded corners, enable masksToBounds
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            guard let cg = layer.borderColor else { return nil }
            return UIColor(cgColor: cg)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
        
    }
}
