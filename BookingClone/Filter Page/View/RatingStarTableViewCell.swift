//
//  RatingStarTableViewCell.swift
//  BookingClone
//
//  Created by Work on 09/08/25.
//

import UIKit

class RatingStarTableViewCell: UITableViewCell {

    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    var selectedRating = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let buttons = [btn1, btn2, btn3, btn4, btn5]
               for (index, button) in buttons.enumerated() {
                   button?.tag = index + 1 // 1 to 5
                   button?.addTarget(self, action: #selector(starTapped(_:)), for: .touchUpInside)
                   button?.setImage(UIImage(named: "starBefore")?.withRenderingMode(.alwaysOriginal), for: .normal)
               }
    }
    
    @objc func starTapped(_ sender: UIButton) {
            selectedRating = sender.tag
            updateStars()
        }
        
    func updateStars() {
        let buttons = [btn1, btn2, btn3, btn4, btn5]
        for (index, button) in buttons.enumerated() {
            if index < selectedRating {
                button?.setImage(UIImage(named: "starAfter")?.withRenderingMode(.alwaysOriginal), for: .normal)
            } else {
                button?.setImage(UIImage(named: "starBefore")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
