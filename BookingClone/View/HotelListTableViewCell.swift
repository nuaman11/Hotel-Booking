//
//  HotelListTableViewCell.swift
//  BookingClone
//
//  Created by Work on 16/07/25.
//

import UIKit

class HotelListTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelLbl: UILabel!
    @IBOutlet weak var hotelImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
