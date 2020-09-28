//
//  loginView.swift
//  hw2
//
//  Created by Montypass on 20.09.2020.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
     func validate(login: String, password: String)
     func hideLoginView()
 }

class LoginView: UIView {
    
    @IBOutlet var authorizationStatusView: UIView!
    @IBOutlet var authorizationStatusLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var haveNoAccountLabel: UILabel!
    @IBOutlet var signUpButton: UIButton!
    
    weak var delegate: LoginViewDelegate?
    
    @IBAction func loginAction(_ sender: Any) {
        delegate?.validate(login: nameTextField.text!, password: passwordTextField.text!)
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        delegate?.hideLoginView()
    }
    
    
    
    
    
}
