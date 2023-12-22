//
//  AutoListViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//

import UIKit

final class AutoListViewController: UITableViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        user.autos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "autoCell", for: indexPath)
        let auto = user.autos[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = auto.autoName
        
        cell.contentConfiguration = content
        return cell
    }
}
