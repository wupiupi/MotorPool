//
//  FuelTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 03.01.2024.
//

import UIKit

class FuelTableViewCell: UITableViewCell {
    
    @IBOutlet var fuelPriceTitleLabel: UILabel!

    @IBOutlet var fuelCountLabel: UILabel!
    @IBOutlet var unitGasolineLabel: UILabel!
    
    @IBOutlet var quantityFuelSlider: UISlider!
    @IBOutlet var unitOfMeasureFuelSwitch: UISwitch! {
        didSet {
            unitOfMeasureFuelSwitch.isOn = false
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
        fuelPriceTitleLabel.text = calculateFuelPrice()
        fuelCountLabel.text = calculateFuelPrice()
    }
    
    @IBAction func quantityFuelSliderMove() {
        fuelCountLabel.text = string(from: quantityFuelSlider)
        fuelPriceTitleLabel.text = calculateFuelPrice()
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.1f", slider.value)
    }
    
    private func calculateFuelPrice() -> String {
        let literFuel = 1.3
        
        if unitOfMeasureFuelSwitch.isOn {
            unitGasolineLabel.text = "gallon's"
            let gallonFuel = 3.8 * literFuel
            let calculateFuel = (Double(string(from: quantityFuelSlider)) ?? 0) * gallonFuel
            
            return String(format: "%.1f $", calculateFuel)
        } else {
            unitGasolineLabel.text = "liter"
            let calculateFuel = (Double(string(from: quantityFuelSlider)) ?? 0) * literFuel
            
            return String(format: "%.1f $", calculateFuel)
        }
        
        
    }
}
