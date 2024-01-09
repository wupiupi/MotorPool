//
//  InformationTotalTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 29.12.2023.
//

import UIKit

final class TotalPriceTableViewCell: UITableViewCell {

    @IBOutlet var priceSegmentedControl: UISegmentedControl! {
        didSet {
            priceSegmentedControl.selectedSegmentTintColor = .black
            priceSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        }
    }
    
    @IBOutlet var priceLabel: UILabel! {
        didSet {
            priceLabel.textColor = .white
        }
    }
    
    var priceUSD: String!
    var priceRUB: String!
    var priceEUR: String!
    
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
