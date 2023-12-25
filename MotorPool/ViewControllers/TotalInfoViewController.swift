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
            carFavoriteLabel.text = favoriteCar()
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
    
    private func favoriteCar() -> String {
        var favoriteCars: [String: Int] = [:]
        let modelCars = user.autos.map { $0.model }
        
        for modelCar in modelCars {
            favoriteCars[modelCar, default: 0] += 1
        }
        
        let sortedFavoriteCars = favoriteCars.sorted { $0.value > $1.value }
        guard let mostFavoriteCar = sortedFavoriteCars.first?.key else { return "" }
        
        return mostFavoriteCar
    }

    
}
