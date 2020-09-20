//
//  LoginView.swift
//  LoginApp
//
//  Created by Albert Ahmadiev on 19.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func validate(username: String, password: String)
    func hideSignIn()
}

class LoginView: UIView {
    
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var checkingView: CheckingView!
    
    weak var delegateLogin: LoginViewDelegate?
    
    @IBAction func signInTap(_ sender: Any) {
        delegateLogin?.validate(username: usernameField.text!, password: passwordField.text!)
    }
    
    @IBAction func signUpTap(_ sender: Any){
        delegateLogin?.hideSignIn()
    }
    
}
