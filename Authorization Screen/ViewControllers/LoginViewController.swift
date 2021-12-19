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
    private var user = "Johnny"
    private var password = "777"
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userName = user
    }
    
    
    
    // MARK: - IB Actions
    @IBAction func loginPressed() {
        if userNameLabel.text != user || passwordLabel.text != password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordLabel)
        }
    }
    @IBAction func forgotUserData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Help", message: "Your password is \(password)")
        : showAlert(title: "Help", message: "Your user name is \(user)")
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
