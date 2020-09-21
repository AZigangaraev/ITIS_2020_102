//
//  AuthorizationView.swift
//  Homework
//
//  Created by Эвелина on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit
protocol AuthorizationDelegate: AnyObject {
    func available(username: String, password: String)
    func signUpTap()
}
class AuthorizationView: UIView {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    weak var delegate: AuthorizationDelegate?
    
    @IBAction func signUpButtonTap(_ sender: Any) {
        delegate?.signUpTap()
        
    }
    @IBAction func SignInButtonTapped(_ sender: Any) {
        delegate?.available(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
}
