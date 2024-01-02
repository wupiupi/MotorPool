//
//  InfoViewController.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 27.12.2023.
//

import UIKit

final class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: IBOutlets
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var randomCarView: UIView! {
        didSet {
            randomCarView.center = view.center
            randomCarView.layer.cornerRadius = 10
            randomCarView.layer.borderWidth = 1
            randomCarView.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet var randomCarImageView: UIImageView! {
        didSet {
            randomCarImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet var randomCarTitleLabel: UILabel! {
        didSet {
            randomCarTitleLabel.font = .boldSystemFont(ofSize: 18)
        }
    }
    @IBOutlet var randomCarButton: UIButton! {
        didSet {
            randomCarButton.layer.cornerRadius = 5
            randomCarButton.layer.borderWidth = 1
            randomCarButton.backgroundColor = .black
            randomCarButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
            randomCarButton.setTitleColor(.white, for: .normal)
            randomCarButton.setTitle("GET STARTED 😈", for: .normal)
        }
    }
    
    @IBOutlet var visualEffectView: UIVisualEffectView! {
        didSet {
            visualEffectView.center = view.center
            visualEffectView.bounds = view.bounds
            visualEffectView.backgroundColor = UIColor(patternImage: .back)
        }
    }
        
    // MARK: Properties
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: IBAction func
    @IBAction func randomCarDidTapped() {
        animateOut(view: randomCarView)
    }
    
    @IBAction func carForTodayDidTapped() {
        var carDict: [String: String] = [:]
        
        let carModels = user.autos.map { $0.model }
        let carBrands = user.autos.map { $0.brand }
        
        for (model, brand) in zip(carModels, carBrands) {
            carDict[model] = brand
        }

        let randomCar = carDict.randomElement()
        
        randomCarImageView.image = UIImage(named: "\(randomCar?.key ?? "") \(randomCar?.value ?? "")")
        randomCarTitleLabel.text = "\(randomCar?.key ?? "") \(randomCar?.value ?? "")"
        
        view.addSubview(visualEffectView)
        view.addSubview(randomCarView)
        
        animateIn(view: randomCarView)
    }
}

// MARK: InfoViewControllerDataSource
extension InfoViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as? FavoriteCarTableViewCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "totalCell", for: indexPath) as? TotalCarsTableViewCell else { return UITableViewCell() }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "priceCell", for: indexPath) as? TotalPriceTableViewCell else { return UITableViewCell() }
            
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
        case 2:
            let priceCell = tableView.dequeueReusableCell(withIdentifier: "priceCell")
            as? TotalPriceTableViewCell
            
            priceCell?.priceUSD = priceInUSD()
            priceCell?.priceEUR = priceInEUR()
            priceCell?.priceRUB = priceInRUB()
            
            return priceCell
        default:
            return UIView()
        }
    }
        
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        150
    }
}

// MARK: Logic func
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
    
    func priceInUSD() -> String {
        
        var totalCost = 0.0
        user?.autos.forEach { totalCost += $0.price }

        var stringCost = String(format: "%.3f", totalCost)
        if totalCost > 1000 {
            stringCost.insert(".", at: stringCost.index(after: stringCost.startIndex))
        }
        
        let formattedCost = stringCost.map { String($0) + " " }
        
        return "\(formattedCost.joined(separator: " ")) $"
    }
    
    func priceInEUR() -> String {
        var totalCost = 0.0
        user?.autos.forEach { totalCost += $0.price }
        let totalEUR = totalCost * 1.2

        var stringCost = String(format: "%.3f", totalEUR)
        if totalCost > 1000 {
            stringCost.insert(".", at: stringCost.index(after: stringCost.startIndex))
        }
        
        let formattedCost = stringCost.map { String($0) + " " }
        
        return "\(formattedCost.joined(separator: " ")) €"
    }
    
    func priceInRUB() -> String {
        var totalCost = 0.0
        user?.autos.forEach { totalCost += $0.price }
        let totalRUB = totalCost * 90

        var stringCost = String(format: "%.3f", totalRUB)
        if totalCost > 1000 {
            stringCost.insert(".", at: stringCost.index(stringCost.startIndex, offsetBy: 3))
        }
        
        let formattedCost = stringCost.map { String($0) + " " }
        
        return "\(formattedCost.joined(separator: " ")) ₽"
    }
}

// MARK: Animate func
private extension InfoViewController {
    func animateIn(view: UIView) {
        view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        visualEffectView.alpha = 0
        view.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.visualEffectView.alpha = 1
            view.alpha = 1
            view.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut(view: UIView) {
        
        UIView.animate(withDuration: 1.0) {
            self.visualEffectView.alpha = 0
            view.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            view.alpha = 0
        } completion: { _ in
            self.visualEffectView.removeFromSuperview()
            view.removeFromSuperview()
        }
    }
}
