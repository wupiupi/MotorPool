//
//  LoginViewController.swift
//  MotorPool
//
//  Created by Serge Bowski on 12/22/23.
//

import UIKit

final class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    
    //  MARK: - Private Properties
    private let user = User.getUser()
    
    // MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(
        withIdentifier identifier: String,
        sender: Any?
    ) -> Bool {
        guard usernameTextField.text == user.username,
              passwordTextField.text == user.password else {
            alert(with: "Invalid login or password",
                  and: "Please, enter correct login and password") {
                self.passwordTextField.text = ""
            }
            return false
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let tabBarVC = segue.destination as? TabBarViewController else {
            return
        }
        
        tabBarVC.user = user
    }
    
    // MARK: - IB Actions
    @IBAction private func forgotUsernameAction() {
        alert(with: "Oops!", and: "Your name is \(user.username) 😉")
    }
    
    @IBAction private func forgotPasswordAction() {
        alert(with: "Oops!", and: "Your password is \(user.password) 😉")
    }
    
    // MARK: - Private Methods

    private func alert(
        with title: String,
        and message: String,
        completion: (() -> ())? = nil
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alert.addAction(okButton)
        present(alert, animated: true)
    }

}
