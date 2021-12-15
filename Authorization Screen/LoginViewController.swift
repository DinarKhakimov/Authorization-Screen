//
//  ViewController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/15/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeViewController = segue.destination as? WelcomeViewController else { return }
        welcomeViewController.userName = userNameLabel.text
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
    }
    @IBAction func forgotUserNameButton(_ sender: UIButton) {
        showAlert(title: "User Name", message: "Boby")
    }
    @IBAction func forgotPasswordButton(_ sender: Any) {
        showAlert(title: "Password", message: "777")
    }
    @IBAction func unwind(for: UIStoryboardSegue) {
        userNameLabel.text = ""
        passwordLabel.text = ""
    }
}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
