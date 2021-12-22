//
//  ViewController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    // MARK: - Private properties
    private var user = User.getPersonData()
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        viewControllers.forEach { viewController in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = user
            } else if let navigationVC = viewController as? UINavigationController {
                let aboutUserVC = navigationVC.topViewController as! AboutUserViewController
                aboutUserVC.userName = user
            }
        }
    }
    // MARK: - IB Actions
    @IBAction func loginPressed() {
        if userNameLabel.text != user.login || passwordLabel.text != user.password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordLabel)
        }
    }
    @IBAction func forgotUserData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Help", message: "Your password is \(user.password)")
        : showAlert(title: "Help", message: "Your user name is \(user.login)")
    }
    
    @IBAction func unwind(for: UIStoryboardSegue) {
        userNameLabel.text = ""
        passwordLabel.text = ""
    }
}

// MARK: - Extensions & Show Alert Controllera
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Setup Text Field
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameLabel {
            passwordLabel.becomeFirstResponder()
        } else {
            loginPressed()
            performSegue(withIdentifier: "showWelcomViewController", sender: nil)
        }
        return true
    }
}
