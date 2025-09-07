//
//  NumberOfBedTableViewCell.swift
//  BookingClone
//
//  Created by Work on 12/08/25.
//

import UIKit

class NumberOfBedTableViewCell: UITableViewCell {

    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    @IBOutlet weak var countLabel: UILabel!   // Label to display the number

        private var count: Int = 0 {
            didSet {
                countLabel.text = "\(count)"
            }
        }

        override func awakeFromNib() {
            super.awakeFromNib()
            count = 0   // initial value
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        @IBAction func plusButtonTapped(_ sender: UIButton) {
            count += 1
        }
        
        @IBAction func minusButtonTapped(_ sender: UIButton) {
            if count > 0 { // avoid negative numbers
                count -= 1
            }
        }
    }
