//
//  SignUpView.swift
//  LoginApp
//
//  Created by Albert Ahmadiev on 19.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

protocol SignUpDelegate: AnyObject {
    func validate(username: String, password: String, confirmPassword: String)
    func hideSignUp()
}

class SignUpView: UIView {

    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var confirmPasswordField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    weak var delegateSignUp: SignUpDelegate?
    
    @IBAction func signUpTap(_ sender: Any){
        delegateSignUp?.validate(username: usernameField.text!, password: passwordField.text!, confirmPassword: confirmPasswordField.text!)
        delegateSignUp?.hideSignUp()
    }
    
    @IBAction func signInTap(_ sender: Any){
           delegateSignUp?.hideSignUp()
       }

}
