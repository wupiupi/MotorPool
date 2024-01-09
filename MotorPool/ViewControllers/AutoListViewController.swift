//
//  AutoListViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//  Functionality is made by wupiupi.
//

import UIKit

final class AutoListViewController: UITableViewController {
    
    // MARK: - Variables
    var user: User!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "back"))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailsVC = segue.destination as? DetailsViewController else { return }
        
        detailsVC.car = user.autos[indexPath.row]
    }
}

// MARK: - UITableViewDataSource
extension AutoListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.autos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "autoCell", for: indexPath)
        let auto = user.autos[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = auto.brand
        content.textProperties.color = .systemGray6
        content.secondaryText = auto.model
        content.secondaryTextProperties.color = .systemGray4
        content.image = UIImage(named: auto.model + " " + auto.brand)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.backgroundColor = .clear
        cell.contentConfiguration = content
        return cell
    }
}

// MARK: - UITableViewDelegate
extension AutoListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
