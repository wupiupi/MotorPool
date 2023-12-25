//
//  TotalInfoViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//

import UIKit

final class TotalInfoViewController: UIViewController {
    
    @IBOutlet var carCountLabel: UILabel!
    @IBOutlet var carFavoriteLabel: UILabel!
    @IBOutlet var carTotalCostLabel: UILabel!
    @IBOutlet var carTotalFuelLabel: UILabel!
    
    var user: User!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        
    }
    
    private func updateUI() {
        
        user.autos.forEach { auto in
            carCountLabel.text = String(user.autos.count)
            carFavoriteLabel.text = auto.brand + auto.model
            carTotalCostLabel.text = totalCost()
            carTotalFuelLabel.text = totalFuel()
        }
    }
    
    private func totalCost() -> String {
        var totalCost = 0.0
        user.autos.forEach { totalCost += $0.price }
        
        var stringCost = String(format: "%.3f", totalCost)
        if totalCost > 1000 {
            stringCost.insert(".", at: stringCost.index(after: stringCost.startIndex))
        }
        
        return "\(stringCost) $"
    }
    
    private func totalFuel() -> String {
        var totalFuel = 0.0
        
        user.autos.forEach { totalFuel += $0.fuelConsumption }
        
        return String(format: "%.1f l/100 km" , totalFuel)
    }

    
}
