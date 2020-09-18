//
//  AuthorizationView.swift
//  Homework2
//
//  Created by Ruslan Khanov on 16.09.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class AuthorizationView: UIView {
    @IBOutlet public var loginTextField: UITextField!
    @IBOutlet public var passwordTextField: UITextField!
    
    @IBOutlet var loginStatusView: UIView!
    @IBOutlet var loginStatusLabel: UILabel!
    
    @IBAction func signIn(sender: UIButton) {
        if let login = loginTextField.text, let password = passwordTextField.text {
            
            if UsersData.isUserExist(login: login, password: password) {
                loginStatusView.backgroundColor = UIColor(red: 89.0/255.0, green: 222.0/255.0, blue: 158/255.0, alpha: 1.0)
                loginStatusLabel.text = "Sign in successful"
                
                emptyFields()
            } else {
                loginStatusView.backgroundColor = .red
                loginStatusLabel.text = "Sign in failed"
                
                emptyFields()
            }
        }
    }
    
    func emptyFields() {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}
