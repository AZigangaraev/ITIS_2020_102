//
//  RegistrationClass.swift
//  HomeWork2
//
//  Created by Nail on 20.09.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit
//это loginView просто перепутал названия
protocol LoginDelegate: AnyObject {
    func correct(login: String, password: String)
    func loginViewIsHidden()
}

class LoginViewClass: UIView {

    @IBOutlet weak var LoginInButton: UIButton!

    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var NoAccLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
     weak var delegateLogin: LoginDelegate?
    
    @IBAction func loginInButton(_ sender: Any) {
        delegateLogin?.correct(login: loginTextField.text!, password: passwordTextField.text!)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        delegateLogin?.loginViewIsHidden()
        
   }
    
}
