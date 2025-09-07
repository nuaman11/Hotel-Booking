//
//  BannerTableViewCell.swift
//  BookingClone
//
//  Created by Work on 06/07/25.
//

import UIKit

class BannerTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var headingLbl: UILabel!
        
    @IBOutlet weak var collectionViewBanner: UICollectionView!
    let destinationImageNames = ["destination1", "destination2", "destination3", "destination4","destination5"]
    
    let placesNames = ["Riyadh", "Damam", "Jeddah", "Khobar", "Tabuk"]

    var cellname: String = ""

    var bannerImages: [UIImage] = [
//        UIImage(named: "banner1")!,
//        UIImage(named: "banner2")!,
//        UIImage(named: "banner3")!,
//        UIImage(named: "banner4")!,
    ]
    
    var callbackHotel : (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib = UINib(nibName: "BannerCollectionViewCell", bundle: nil)
        collectionViewBanner.register(
            nib,
            forCellWithReuseIdentifier: "BannerItemCell"
        )
        
        let nib2 = UINib(nibName: "ImageBannerCollectionViewCell", bundle: nil)
        collectionViewBanner.register(
            nib2,
            forCellWithReuseIdentifier: "BannerItemCell2"
        )

        collectionViewBanner.dataSource = self
        collectionViewBanner.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with images: [UIImage]) {
            self.bannerImages = images
            collectionViewBanner.reloadData()
        }

}
extension BannerTableViewCell {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if cellname == "offerCell" {
            callbackHotel?()
        }else{
            callbackHotel?()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if cellname == "offerCell" {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerItemCell", for: indexPath) as! BannerCollectionViewCell
            // cell.imageView.image = bannerImages[indexPath.item]
            return cell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerItemCell2", for: indexPath) as! ImageBannerCollectionViewCell
            // cell.imageView.image = bannerImages[indexPath.item]
            let randomImageName = destinationImageNames.randomElement() ?? "destination1"
            cell.bannerImage.image = UIImage(named: randomImageName)
            
            let randomPlaces = placesNames.randomElement() ?? "Riyadh"
            cell.placesLabel.text = randomPlaces
            
            return cell
            
        }
    }
}



