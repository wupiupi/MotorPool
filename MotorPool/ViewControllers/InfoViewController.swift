//
//  InfoViewController.swift
//  MotorPool
//
//  Created by Pavel Gribachev on 27.12.2023.
//

import UIKit

final class InfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self        
    }
    
}

// MARK: InfoViewControllerDataSource
extension InfoViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "ss"
        
        cell.contentConfiguration = content
        return cell
    }
    
}

// MARK: InfoViewControllerDelegate
extension InfoViewController {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let favoriteCar = favoriteCar()
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell")
        as? FavoriteCarTableViewCell
        
        cell?.brandImageView.image = UIImage(named: favoriteCar)
        cell?.brandNameLabel.text = favoriteCar
        
        return cell
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
}
