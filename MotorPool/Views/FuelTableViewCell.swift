//
//  FuelTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 03.01.2024.
//

import UIKit

class FuelTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet var fuelPriceTitleLabel: UILabel!

    @IBOutlet var fuelCountTextField: UITextField!
    @IBOutlet var unitGasolineLabel: UILabel!
    
    @IBOutlet var quantityFuelSlider: UISlider!
    @IBOutlet var unitOfMeasureFuelSwitch: UISwitch!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        fuelCountTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        endEditing(true)
    }
    
    @IBAction func quantityFuelSliderMove() {
        fuelCountTextField.text = string(from: quantityFuelSlider)
        fuelPriceTitleLabel.text = calculateFuelPrice()
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.1f", slider.value)
    }
    
    private func calculateFuelPrice() -> String {
        let fuelPrice = 1.3
        let calculateFuel = (Double(string(from: quantityFuelSlider)) ?? 0) * fuelPrice
        
        return String(format: "%.1f $", calculateFuel)
    }
}

extension UITextFieldDelegate {
    
}
