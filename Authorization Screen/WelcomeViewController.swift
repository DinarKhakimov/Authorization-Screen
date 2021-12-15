//
//  WelcomeViewController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/15/21.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String!
    let welcome = "Welcome, "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = welcome + userName
    }
    @IBAction func logOutButton(_ sender: UIButton) {
    }
}
