//
//  AboutMeController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/20/21.
//

import Foundation
import UIKit

class AboutMeController: UIViewController {
    
    var aboutMe = User.personData()
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        navigationItem.title = "\(aboutMe.name)  + \(aboutMe.surname) + \(aboutMe.aboutPerson) "
        

        
    }
}
