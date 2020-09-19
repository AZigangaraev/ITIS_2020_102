//
//  SignInView.swift
//  Homework
//
//  Created by Robert Mukhtarov on 19.09.2020.
//  Copyright © 2020 Robert Mukhtarov. All rights reserved.
//

import UIKit

class SignInView: UIView {
    @IBOutlet private var statusView: UIView!
    @IBOutlet private var statusLabel: UILabel!
    @IBOutlet private var loginTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    
    weak var delegate: AuthorizationRegistrationDelegate?
    
    @IBAction private func logInTapped(_ sender: UIButton) {
        guard let delegate = delegate, let login = loginTextField.text, let password = passwordTextField.text else { return }
        if delegate.isUserDataCorrect(login: login, password: password) {
            statusView.backgroundColor = .systemGreen
            statusLabel.text = "Sign in successful"
        } else {
            statusView.backgroundColor = .systemRed
            statusLabel.text = "Sign in failed"
        }
    }
    
    @IBAction private func signUpTapped(_ sender: UIButton) {
        delegate?.switchToSignUp()
        reset()
    }
    
    private func reset() {
        statusView.backgroundColor = .systemGray
        statusLabel.text = "Need to sign in to continue"
        loginTextField.text = ""
        passwordTextField.text = ""
    }
}
