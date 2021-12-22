//
//  MyImageController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/20/21.
//

import Foundation
import UIKit

class UserImageViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var userName: User!
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        imageView.image = UIImage(named: userName.person.image)
    }
}
