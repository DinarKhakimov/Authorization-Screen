//
//  AboutMeController.swift
//  Authorization Screen
//
//  Created by Johnny Boshechka on 12/20/21.
//

import Foundation
import UIKit

class AboutUserViewController: UIViewController {
    @IBOutlet weak var aboutUserTextView: UITextView!
    
    var userName: User!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let userImageVC = segue.destination as? UserImageViewController else { return }
        userImageVC.userName = userName
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemGray
        navigationItem.title = userName.person.fullName
        aboutUserTextView.backgroundColor = .systemGray
        aboutUserTextView.text = userName.person.aboutPerson
    }
    @IBAction func userImageButton() {
        if userName.person.image != "IMG_0264" {
            showAlertController(title: "Oops", message: "This user has not image")
        }
    }
}


extension AboutUserViewController {
    private func showAlertController(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
