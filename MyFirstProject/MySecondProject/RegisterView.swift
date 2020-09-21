//
//  RegisterView.swift
//  MySecondProject
//
//  Created by Joseph on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordRepetitionField: UITextField!

    weak var controller: ViewController?
    
    func cleanField() {
        [loginField, passwordField, passwordRepetitionField].forEach {
            $0?.text = ""
        }
    }
    
    @IBAction func goToLoginPressed(_ sender: Any) {
        controller!.setUpLoginView()
    }
    @IBAction func registerUserButtonPressed(_ sender: Any) {
        guard let login = loginField.text, let password = passwordField.text, let passwordRep = passwordRepetitionField.text else {
            print("Fill all the fields")
            return
        }

        if users.keys.contains(login) {
            print("User already exists")
        } else if (password.count <= 5) {
            print("Password too short")
        } else if (password != passwordRep) {
            print("Password mismatch")
        } else {
            users[login] = password
        }
        
        showAlertWithDistructiveButton(title: "Succesful Registration", message: "")
        
        controller!.setUpLoginView()
    }
    
    
    func showAlertWithDistructiveButton(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))

        controller!.present(alert, animated: true, completion: nil)
    }
}
