//
//  DetailsViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Variables
    var user: User!
    
    
    // MARK: - IB Outlets
    @IBOutlet var carModelLabel: UILabel!
    
    @IBOutlet var carImageView: UIImageView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
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

