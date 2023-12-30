//
//  InformationTotalTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 29.12.2023.
//

import UIKit

class TotalPriceTableViewCell: UITableViewCell {

    @IBOutlet var priceLabel: UILabel!
    
    var priceUSD: String!
    var priceRUB: String!
    var priceEUR: String!
                
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func priceSegmentedChangeValue(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            priceLabel.text = priceUSD
        case 1:
            priceLabel.text = priceEUR
        case 2:
            priceLabel.text = priceRUB
        default:
            break
        }
    }
}
