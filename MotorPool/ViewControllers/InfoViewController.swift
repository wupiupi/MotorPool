//
//  InfoViewController.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 27.12.2023.
//

import UIKit

final class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var randomCarView: UIView!
    @IBOutlet var randomCarImageView: UIImageView!
    @IBOutlet var randomCarTitleLabel: UILabel!
    @IBOutlet var randomCarButton: UIButton!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
       
    }
    
    @IBAction func carForTodayDidTapped() {
        var carDict: [String: String] = [:]
        
        let carModels = user.autos.map { $0.model }
        let carBrands = user.autos.map { $0.brand }
        
        for (model, brand) in zip(carModels, carBrands) {
            carDict[model] = brand
        }

        let randomCar = carDict.randomElement()
//        customImageView.image = UIImage(named: "\(randomCar?.key ?? "") \(randomCar?.value ?? "")")
//        customLabel.text = "\(randomCar?.key ?? "") \(randomCar?.value ?? "")"
    }
    
    
}

// MARK: InfoViewControllerDataSource
extension InfoViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteCarTableViewCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "totalCell", for: indexPath) as? TotalCarsTableViewCell else { return UITableViewCell() }
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

// MARK: InfoViewControllerDelegate
extension InfoViewController {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
        case 0:
            let favoriteCar = favoriteCar()
            let favoriteCell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell")
            as? FavoriteCarTableViewCell
        
            favoriteCell?.brandImageView.image = UIImage(named: favoriteCar)
            favoriteCell?.brandNameLabel.text = favoriteCar
            
            return favoriteCell
        case 1:
            let totalCell = tableView.dequeueReusableCell(withIdentifier: "totalCell")
            as? TotalCarsTableViewCell
    
            totalCell?.totalLabel.text = totalCar()
            
            return totalCell
        default:
            return UIView()
        }
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150
    }
}

// MARK: Function
private extension InfoViewController {
    
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
    
    func totalCar() -> String {
        return String(user.autos.count)
    }
}
