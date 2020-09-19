//
//  SignInView.swift
//  Homework
//
//  Created by Robert Mukhtarov on 19.09.2020.
//  Copyright © 2020 Robert Mukhtarov. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var confirmPasswordTextField: UITextField!
    
    weak var delegate: AuthorizationRegistrationDelegate?
    
    @IBAction private func signUpTapped(_ sender: UIButton) {
        guard let delegate = delegate, let login = loginTextField.text, let password = passwordTextField.text, let confirmationPassword = confirmPasswordTextField.text else { return }
        guard !login.isEmpty && !password.isEmpty && !confirmationPassword.isEmpty else {
            print("Fields must not be empty")
            return
        }
        guard !delegate.doesUserExist(login: login) else {
            print("User with this login already exists")
            return
        }
        guard password == confirmationPassword else {
            print("Password and confirmation password do not match")
            return
        }
        delegate.addNewUser(login: login, password: password)
        delegate.switchToSignIn()
        reset()
    }
    
    @IBAction private func signInTapped(_ sender: UIButton) {
        delegate?.switchToSignIn()
        reset()
    }
    
    private func reset() {
        loginTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
    }
}
