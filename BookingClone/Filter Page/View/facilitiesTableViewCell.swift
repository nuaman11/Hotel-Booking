//
//  facilitiesTableViewCell.swift
//  BookingClone
//
//  Created by Work on 14/08/25.
//

struct failityTypes {
    let Name: String
    let FacilityImages: UIImage
}

import UIKit

class facilitiesTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var selectedIndex: IndexPath?
    
    var facilityItems: [failityTypes] = [
        failityTypes(Name: "Wifi", FacilityImages: UIImage(named: "amenity2")!),
        failityTypes(Name: "pool", FacilityImages: UIImage(named: "amenity1")!),
        failityTypes(Name: "Garden", FacilityImages: UIImage(named: "amenity3")!),
        failityTypes(Name: "Cleaning Service", FacilityImages: UIImage(named: "amenity4")!),
        failityTypes(Name: "Parking", FacilityImages: UIImage(named: "amenity5")!),
        failityTypes(Name: "Meals", FacilityImages: UIImage(named: "amenity6")!),
        failityTypes(Name: "Drinks", FacilityImages: UIImage(named: "amenity6")!)

    ]

    @IBOutlet weak var facilitiesCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
        facilitiesCollectionView.delegate = self
        facilitiesCollectionView.dataSource = self
        
                let nib = UINib(nibName: "facilitiesImagesCollectionViewCell", bundle: nil)
        facilitiesCollectionView.register(nib, forCellWithReuseIdentifier: "facilitiesImagesCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return facilityItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "facilitiesImagesCollectionViewCell", for: indexPath) as! facilitiesImagesCollectionViewCell
        let item = facilityItems[indexPath.item]
        
        cell.facilityLabel.text = item.Name
        cell.facilityImage.image = item.FacilityImages
        
        if selectedIndex == indexPath {
                    cell.selectedView.backgroundColor = .systemBlue
                    cell.facilityLabel.textColor = .white
                } else {
                    cell.selectedView.backgroundColor = .white
                    cell.facilityLabel.textColor = .black
                }
        
      
                  return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           selectedIndex = indexPath
           collectionView.reloadData()
       }
    
    
    
}
