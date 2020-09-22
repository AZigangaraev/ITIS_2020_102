//
//  registrationView.swift
//  hw2
//
//  Created by Montypass on 20.09.2020.
//

import UIKit

protocol RegistrationViewDelegate: AnyObject {
    func register(login: String,password: String)
    func hideRegistrationView()
}

class RegistrationView: UIView {
    
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var signInButton: UIButton!
    
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmPasswordTextField: UITextField!
    
    
    weak var delegate: RegistrationViewDelegate?
    
    @IBAction func signUpAction(_ sender: Any) {
        if passwordTextField.text == confirmPasswordTextField.text {
            delegate?.register(login: loginTextField.text!, password: passwordTextField.text!)
            
        } else if passwordTextField.text != confirmPasswordTextField.text {
            print("Passwords are not identical")
            statusLabel.text = "Passwords are not identical"
            
        }
    }
    
    
    
    
    @IBAction func signInAction(_ sender: Any) {
        delegate?.hideRegistrationView()
    }
    
}
