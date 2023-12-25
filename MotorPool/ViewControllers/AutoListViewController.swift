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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
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
        content.secondaryText = auto.model
        content.image = UIImage(named: auto.brand + " " + auto.model)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.contentConfiguration = content
        
        return cell
    }
}
