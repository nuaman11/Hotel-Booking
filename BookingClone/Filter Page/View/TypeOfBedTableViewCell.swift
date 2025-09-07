//
//  TypeOfBedTableViewCell.swift
//  BookingClone
//
//  Created by Work on 12/08/25.
//

import UIKit

struct BedType {
    let Name: String
    let Description: String
}

class TypeOfBedTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var selectedIndex: IndexPath?
    
    var bedItems: [BedType] = [
        BedType(Name: "Single Bed", Description: "High To Low"),
        BedType(Name: "Double Bed", Description: "Low To High"),
        BedType(Name: "King Bed", Description: "High To Low"),
        BedType(Name: "Kids Bed", Description: "Low To High"),
        BedType(Name: "Water Bed", Description: ""),

    ]
    

    @IBOutlet weak var filterCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
      
                filterCollectionView.delegate = self
                filterCollectionView.dataSource = self
        
                let nib = UINib(nibName: "FilterPageBedCollectionViewCell", bundle: nil)
                filterCollectionView.register(nib, forCellWithReuseIdentifier: "FilterPageBedCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterPageBedCollectionViewCell", for: indexPath) as! FilterPageBedCollectionViewCell
        let item = bedItems[indexPath.item]
        
        cell.bedLabel.text = item.Name
        
        if selectedIndex == indexPath {
                    cell.selectedView.backgroundColor = .systemBlue
                    cell.bedLabel.textColor = .white
                } else {
                    cell.selectedView.backgroundColor = UIColor.init(hexString: "E9EBEF")
                    cell.bedLabel.textColor = .black
                }
        
      
                  return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           selectedIndex = indexPath
           collectionView.reloadData()
       }
    
    
    
}
