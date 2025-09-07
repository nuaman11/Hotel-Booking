//
//  BudgetRangeTableViewCell.swift
//  BookingClone
//
//  Created by Work on 09/08/25.
//

import UIKit

class BudgetRangeTableViewCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var budgetLbl: UILabel!
    @IBOutlet weak var budgetRangeSlider: UISlider!
    
    var isFromDistanceFilter = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        budgetRangeSlider.minimumValue = 100
        budgetRangeSlider.maximumValue = 10000
                
    
                // Add target for value change
        budgetRangeSlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        if isFromDistanceFilter == false {
            // Round the value to nearest 100
            let step: Float = 100
            let roundedValue = round(sender.value / step) * step
            sender.value = roundedValue
            
            // Update label
            budgetLbl.text = "USD 100 - \(Int(roundedValue))"
        }else{
            let step: Float = 100
            let roundedValue = round(sender.value / step) * step
            sender.value = roundedValue
            
            // Update label
            budgetLbl.text = "\(Int(roundedValue)) Km"
        }
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
