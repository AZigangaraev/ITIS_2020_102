//
//  RegistrationView.swift
//  Homework2
//
//  Created by Ruslan Khanov on 16.09.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class RegistrationView: UIView {
    var users: [String : String] = [:]
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    @IBAction func signUp(sender: UIButton) {
        guard loginTextField.text != "", passwordTextField.text != "", confirmPasswordTextField.text != ""  else {
            emptyFields()
    
            print("Empty fields")
            return
        }
        guard passwordTextField.text == confirmPasswordTextField.text else {
            emptyFields()
            
            print("Passwords don't match")
            return
        }
        let login = loginTextField.text!
        let password = passwordTextField.text!
        UsersData.addUser(login: login, password: password)
    }
    
    func emptyFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
}
