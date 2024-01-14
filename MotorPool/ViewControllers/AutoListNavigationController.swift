//
//  FirstNavigationViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 1/10/24.
//

import UIKit

final class AutoListNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        customizeNavigationBar()
    }

    private func customizeNavigationBar() {
        let appearance = UINavigationBarAppearance()

        appearance.backgroundEffect = UIBlurEffect(style: .dark)
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = appearance
    }
}
