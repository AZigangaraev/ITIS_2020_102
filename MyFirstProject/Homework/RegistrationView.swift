//
//  RegistrationView.swift
//  Homework
//
//  Created by Эвелина on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit
protocol RegistrationDelegate: AnyObject {
    func available2(username: String, password: String, confirmPassword: String)
}

class RegistrationView: UIView {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
    weak var delegate: RegistrationDelegate?
    @IBOutlet weak var statusViewUp: UIView!
    @IBOutlet weak var statusViewLabel: UILabel!
    @IBAction func signInButtonTap(_sender:Any){
        delegate?.available2(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: passwordConfirmTextField.text ?? "")       }
     @IBAction func signUpButtonTap(_ sender: Any) {
        delegate?.available2(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "", confirmPassword: passwordConfirmTextField.text ?? "")       }
}
