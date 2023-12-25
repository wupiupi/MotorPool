//
//  DetailsViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//  Functionality is made by wupiupi.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Variables
    var user: User!
    var car: Auto!
    
    // MARK: - IB Outlets
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var modelLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var fuelConsumptionLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var carImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carImageView.image = UIImage(named: car.model + " " + car.brand)
        
        brandLabel.text = "Brand: \(car.brand)"
        modelLabel.text = "Model: \(car.model)"
        priceLabel.text = "Price: \(String(car.price))$"
        fuelConsumptionLabel.text = "\(String(car.fuelConsumption)) l/100km"
        
        descriptionLabel.text = car.description
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        carImageView.layer.cornerRadius = carImageView.layer.frame.width / 2
        
    }
    
    // MARK: - IB Action
    @IBAction private func doneButtonDidTapped() {
        dismiss(animated: true)
    }
}

