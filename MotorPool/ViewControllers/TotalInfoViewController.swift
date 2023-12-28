//
//  TotalInfoViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//

import UIKit

final class TotalInfoViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet var carCountLabel: UILabel!
    @IBOutlet var carFavoriteLabel: UILabel!
    @IBOutlet var carTotalCostLabel: UILabel!
    @IBOutlet var carTotalFuelLabel: UILabel!
    @IBOutlet var chooseRandomCarButton: UIButton!
    
    @IBOutlet var customStackView: UIStackView!
    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var customLabel: UILabel!
    @IBOutlet var customButton: UIButton!
    @IBOutlet var customView: UIView!
    
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    // MARK: Properties
    var user: User!
    var effect: UIVisualEffect!
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: Action
    @IBAction func customButtonDidTapped() {
//        customStackView.isHidden = true
        blurEffect.isHidden = true
        
        animatedEffectOutFromView()
    }
    
    @IBAction func chooseRandomCarDidTapped() {
        var carDict: [String: String] = [:]
        
        let carModels = user.autos.map { $0.model }
        let carBrands = user.autos.map { $0.brand }
        
        for (model, brand) in zip(carModels, carBrands) {
            carDict[model] = brand
        }

        let randomCar = carDict.randomElement()
        customStackView.isHidden = false
        customImageView.image = UIImage(named: "\(randomCar?.key ?? "") \(randomCar?.value ?? "")")
        customLabel.text = "\(randomCar?.key ?? "") \(randomCar?.value ?? "")"
        
        blurEffect.layer.backgroundColor = UIColor(patternImage: .back).cgColor
        animatedEffectInFromView()
    }
}

private extension TotalInfoViewController {
    
    // MARK: Update main UI
    func updateUI() {
        user.autos.forEach { auto in
            carCountLabel.text = String(user.autos.count)
            carFavoriteLabel.text = favoriteCar()
            carTotalCostLabel.text = totalCost()
            carTotalFuelLabel.text = totalFuel()
        }
        
        // change button style "chooseRandomCar"
        chooseRandomCarButton.layer.cornerRadius = 10
        chooseRandomCarButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        chooseRandomCarButton.layer.borderWidth = 1
        chooseRandomCarButton.layer.borderColor = UIColor.black.cgColor
        
        updateCustomView()
        
        effect = blurEffect.effect
        blurEffect.isHidden = true
    }
    
    // MARK: Update custom UI
    func updateCustomView() {
        
        //custom stackView
        customStackView.isHidden = true
        
        //custom imageView
        customImageView.layer.cornerRadius = 10
        
        // custom view
        customView.layer.cornerRadius = 10
        customView.layer.borderWidth = 1
        customView.layer.borderColor = UIColor.black.cgColor
        
        // custom button
        customButton.layer.cornerRadius = 10
        customButton.layer.borderWidth = 1
        customButton.backgroundColor = .black
        customButton.tintColor = .white
        customButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        customButton.setTitle("GET STARTED 😈", for: .normal)
        
        // custom label
        customLabel.font = .systemFont(ofSize: 25)
    }
    
    // MARK: Animated
    func animatedEffectInFromView() {
        self.blurEffect.isHidden = false
        view.addSubview(customStackView)
        customStackView.center = view.center
        
        customView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        customView.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.blurEffect.effect = self.effect
            self.customView.alpha = 1
            self.customView.transform = CGAffineTransform.identity
        }
    }
    
    func animatedEffectOutFromView() {
        UIView.animate(withDuration: 0.3) {
            self.customView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.customView.alpha = 0
            
//            self.blurEffect.effect = nil
        }
    }
    
    // MARK: Calculating the total price of cars
    func totalCost() -> String {
        var totalCost = 0.0
        user.autos.forEach { totalCost += $0.price }
        
        var stringCost = String(format: "%.3f", totalCost)
        if totalCost > 1000 {
            stringCost.insert(".", at: stringCost.index(after: stringCost.startIndex))
        }
        
        return "\(stringCost) $"
    }
    
    // MARK: Counting the total amount of fuel
    func totalFuel() -> String {
        var totalFuel = 0.0
        user.autos.forEach { totalFuel += $0.fuelConsumption }
        
        return String(format: "%.1f l/100 km" , totalFuel)
    }
    
    // MARK: Identifying the most frequently encountered vehicle
    func favoriteCar() -> String {
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
