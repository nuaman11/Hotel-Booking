//
//  ApplyButtonTableViewCell.swift
//  BookingClone
//
//  Created by Work on 16/08/25.
//

import UIKit

class ApplyButtonTableViewCell: UITableViewCell {
    var callbackHotel : (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func applyBtnClick(_ sender: Any) {
        callbackHotel?()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
