//
//  WelcomeViewController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/15/21.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - property
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName = ""
    
    private var leftSideColor = UIColor(red: 117/255,
                                   green: 130/255,
                                   blue: 120/255,
                                   alpha: 1)
    private var rightSideColor = UIColor(red: 180/255,
                                      green: 49/255,
                                      blue: 34/255,
                                      alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addHorizontGradientLayer(leftSideColor: leftSideColor, rightSideColor: rightSideColor)
        welcomeLabel.text = "Welcome \(userName)!"
    }
}

// MARK: - Set background color
extension UIView {
    func addHorizontGradientLayer(leftSideColor: UIColor, rightSideColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [leftSideColor.cgColor, rightSideColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        layer.insertSublayer(gradient, at: 0)
    }
}
