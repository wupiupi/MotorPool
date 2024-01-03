//
//  FuelTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 03.01.2024.
//

import UIKit

class FuelTableViewCell: UITableViewCell {
    
    @IBOutlet var fuelPriceTitleLabel: UILabel!
    @IBOutlet var fuelCountTextField: UITextField!
    @IBOutlet var unitGasolineLabel: UILabel!
    
    @IBOutlet var quantityFuelSlider: UISlider!
    @IBOutlet var unitOfMeasureFuelSwitch: UISwitch!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func quantityFuelSliderMove() {
        
    }
}
