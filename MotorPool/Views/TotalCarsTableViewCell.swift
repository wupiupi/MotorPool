//
//  TotalCarsTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 28.12.2023.
//

import UIKit

final class TotalCarsTableViewCell: UITableViewCell {

    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var carForTodayButton: UIButton!
    @IBOutlet var totalBackgraundColor: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        carForTodayButton.layer.cornerRadius = 10
        carForTodayButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        carForTodayButton.layer.borderWidth = 1
        carForTodayButton.layer.borderColor = UIColor.white.cgColor
//        carForTodayButton.backgroundColor = .black
        carForTodayButton.setTitle("pick me a car", for: .normal)
    }
    

    
}
