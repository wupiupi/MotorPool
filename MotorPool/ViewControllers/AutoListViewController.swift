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
        
        
        cell.contentConfiguration = content
        return cell
    }
}
