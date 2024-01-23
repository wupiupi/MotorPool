//
//  FuelTableViewCell.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 03.01.2024.
//

import UIKit

final class FuelInfoViewController: UIViewController {
    
    // MARK: @IBOutlet
    @IBOutlet var fuelPriceLabel: UILabel!
    
    @IBOutlet var fuelCountTextField: UITextField! {
        didSet {
            fuelCountTextField.layer.cornerRadius = 10
            fuelCountTextField.layer.borderWidth = 1
            fuelCountTextField.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet var fuelDescriptionLabel: UILabel!

    @IBOutlet var fuelCountSlider: UISlider!
    
    @IBOutlet var fuelSwitch: UISwitch! {
        didSet {
            fuelSwitch.isOn = false
        }
    }
    
    @IBOutlet weak var backView: UIView!
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fuelPriceLabel.text = calculateFuelPrice()
        fuelCountTextField.text = string(from: fuelCountSlider)
        
        fuelCountTextField.delegate = self
        overlayBlurredBackgroundView()
    }
    
    // MARK: touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
    
    
    // MARK: @IBAction
    @IBAction func quantityFuelSliderMove() {
        fuelPriceLabel.text = calculateFuelPrice()
        fuelCountTextField.text = string(from: fuelCountSlider)
    }
    
    @IBAction func didChangeValueSwitch() {
        fuelPriceLabel.text = calculateFuelPrice()
        fuelCountTextField.text = string(from: fuelCountSlider)
    }
    
    @IBAction func doneButtonDidTapped() {
        dismiss(animated: true)
    }
}

// MARK: Function
private extension FuelInfoViewController {
    func calculateFuelPrice() -> String {
        let fuelPrice = 1.3
        let gallon = 3.8

        if fuelSwitch.isOn {
            fuelDescriptionLabel.text = "gallon's of gasoline"
            let gallonFuel = gallon * fuelPrice
            let calculateFuel = (Double(string(from: fuelCountSlider)) ?? 0) * gallonFuel
            
            return String(format: "%.1f $", calculateFuel)
        } else {
            fuelDescriptionLabel.text = "liter of gasoline"
            let calculateFuel = (Double(string(from: fuelCountSlider)) ?? 0) * fuelPrice
            
            return String(format: "%.1f $", calculateFuel)
        }
    }
    
    func string(from slider: UISlider) -> String {
        String(format: "%.1f", slider.value)
    }
    
    func showAlert(withTitle title: String, andMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func isValidDouble(number: Float) -> Bool {
        let currentValue = String(format: "%.1f", number)
        let inputValue = fuelCountTextField.text
        
        if inputValue == currentValue {
            return true
         } else if (1...100).contains(Int(inputValue ?? "") ?? 0) {
             return true
         } else {
           return false
         }
    }
    
    func overlayBlurredBackgroundView() {
        let blurredBackgroundView = UIVisualEffectView()
        
        blurredBackgroundView.frame = view.frame
        blurredBackgroundView.effect = UIBlurEffect(style: .dark)
        
        backView.addSubview(blurredBackgroundView)
        view.backgroundColor = .clear
    }
}

// MARK: UITextFieldDelegate
extension FuelInfoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {
            showAlert(
                withTitle: "Incorrect format",
                andMessage: "Please enter correct value"
            )
            return
        }

        guard let currentValue = Float(text), (1.0...100.0).contains(currentValue) else {
            showAlert(
                withTitle: "Incorrect format",
                andMessage: "Please enter a value from 1.0 to 100.0") {
                    self.fuelCountTextField.text = self.string(from: self.fuelCountSlider)
                    self.fuelCountTextField.layer.borderColor = UIColor.systemRed.cgColor
                }
            return
        }
        
        if isValidDouble(number: currentValue) {
            fuelCountSlider.setValue(currentValue, animated: true)
            fuelPriceLabel.text = calculateFuelPrice()
            fuelCountTextField.layer.borderColor = UIColor.systemGreen.cgColor
        } else {
            showAlert(
                withTitle: "Incorrect format",
                andMessage: "The value must be either an integer or a decimal with one decimal place") {
                    self.fuelCountTextField.text = self.string(from: self.fuelCountSlider)
                    self.fuelCountTextField.layer.borderColor = UIColor.systemRed.cgColor
                }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        fuelCountTextField.perform(#selector(selectAll), with: textField, afterDelay: 0)
        fuelCountTextField.layer.borderColor = UIColor.black.cgColor
    }
}
