//
//  TabBarViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        setTabBarItems()
        transferData()
    }
    
    private func transferData() {
        guard let navigationVC = viewControllers?.first as? UINavigationController else { return }
        guard let totalInfoVC = viewControllers?[1] as? AutoListViewController else { return }
        
        let autoListVC = navigationVC.topViewController
        guard let autoListVC = autoListVC as? AutoListViewController else { return }
        autoListVC.user = user
        
        totalInfoVC.user = user
    }
    
    private func setTabBarItems() {
        viewControllers?.forEach {
            if $0 is UINavigationController {
                $0.tabBarItem = UITabBarItem(
                    title: "Auto",
                    image: UIImage(systemName: "car"),
                    tag: 0
                )
            } else if $0 is TotalInfoViewController {
                $0.tabBarItem = UITabBarItem(
                    title: "Total",
                    image: UIImage(systemName: "info"),
                    tag: 1
                )
            } else {
                $0.tabBarItem = UITabBarItem(
                    title: "About",
                    image: UIImage(systemName: "person.2.fill"),
                    tag: 2
                )
            }
        }
    }
}
