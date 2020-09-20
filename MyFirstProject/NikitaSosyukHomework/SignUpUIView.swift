//
//  SignUpUIView.swift
//  NikitaSosyukHomework
//
//  Created by Nikita Sosyuk on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

protocol SignUpDelegate: AnyObject {
    func changToSignIn()
    func addData(username: String, password: String)
}

class SignUpUIView: UIView {
    
    @IBOutlet private var usernameTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var passwordConfirmTextField: UITextField!
    @IBOutlet private var signInButton: UIButton!
    @IBOutlet private var signUpButton: UIButton!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var signUpLabel: UILabel!
    
    weak var delegate: SignUpDelegate?
    
    func load() {
        textLabel.text = "Already signed up?"
        signUpLabel.text = "Sign Up View"
        signUpLabel.textColor = .systemPink
        signUpLabel.textAlignment = .center
        
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        usernameTextField.text = ""
        passwordTextField.text = ""
        passwordConfirmTextField.text = ""
        passwordConfirmTextField.placeholder = "Password Confirm"
        passwordTextField.isSecureTextEntry = true
        passwordConfirmTextField.isSecureTextEntry = true
        
        signUpButton.setTitle("Sign up", for: .normal)
        signInButton.setTitle("Sign in", for: .normal)
    }
    
    @IBAction func signUpButtonAction() {
        if let username = usernameTextField.text,
            let password = passwordTextField.text,
            let passwordConfirm = passwordConfirmTextField.text {
            if password != "" && username != "" && passwordConfirm != "" {
                if password == passwordConfirm {
                    delegate?.addData(username: username, password: password)
                } else {
                    print("Password doesn't confirm")
                }
            } else {
                print("One or more text field is empty")
            }
        }
    }
    
    @IBAction func signInButtonAction() {
        delegate?.changToSignIn()
    }
}
