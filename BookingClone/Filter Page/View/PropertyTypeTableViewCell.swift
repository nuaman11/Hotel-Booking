//
//  PropertyTypeTableViewCell.swift
//  BookingClone
//
//  Created by Work on 13/08/25.
//

import UIKit

class PropertyTypeTableViewCell: UITableViewCell,UICollectionViewDelegate, UICollectionViewDataSource {
    
    var selectedIndex: IndexPath?
    
    var bedItems: [BedType] = [
        BedType(Name: "Resort", Description: "High To Low"),
        BedType(Name: "Cottage", Description: "Low To High"),
        BedType(Name: "Farm house", Description: "High To Low"),
        BedType(Name: "Camps", Description: "Low To High"),
        BedType(Name: "Villas", Description: ""),

    ]
    

    @IBOutlet weak var filterCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
                filterCollectionView.delegate = self
                filterCollectionView.dataSource = self
        
                let nib = UINib(nibName: "TypesOfpropertyCollectionViewCell", bundle: nil)
                filterCollectionView.register(nib, forCellWithReuseIdentifier: "TypesOfpropertyCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypesOfpropertyCollectionViewCell", for: indexPath) as! TypesOfpropertyCollectionViewCell
        let item = bedItems[indexPath.item]
        
        cell.typeLabel.text = item.Name
        
        if selectedIndex == indexPath {
                    cell.selectedView.backgroundColor = .systemBlue
                    cell.typeLabel.textColor = .white
                } else {
                    cell.selectedView.backgroundColor = UIColor.init(hexString: "E9EBEF")
                    cell.typeLabel.textColor = .black
                }
        
      
                  return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           selectedIndex = indexPath
           collectionView.reloadData()
       }
    
    
    
}
