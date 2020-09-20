//
//  LoginView.swift
//  Homework2
//
//  Created by Олег Романов on 18.09.2020.
//  Copyright © 2020 Oleg Romanov. All rights reserved.
//

import UIKit

protocol SignInDelegate: AnyObject {
    func login(login: String, password: String)
    func signUp()
    func addNewPerson(login: String, password: String)
}

class LoginView: UIView {
    
    weak var delegate: SignInDelegate?
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "Need to sign in to continue"
        label.textColor = UIColor.white
        label.frame = CGRect(x: 40, y: 60, width: UIScreen.main.bounds.width, height: 30)
       return label
    } ()
    
    private let headerView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150)
        view.backgroundColor = UIColor.lightGray
        return view
    } ()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: UIScreen.main.bounds.width * 0.25, y: 200, width: UIScreen.main.bounds.width * 0.5, height: 40)
        textField.borderStyle = .roundedRect
        textField.placeholder = "login"
        textField.autocapitalizationType = .none
        return textField
    } ()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.frame = CGRect(x: UIScreen.main.bounds.width * 0.25, y: 250, width: UIScreen.main.bounds.width * 0.5, height: 40)
        textField.borderStyle = .roundedRect
        textField.placeholder = "password"
        textField.isSecureTextEntry = true
        return textField
    } ()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.width * 0.5 + 10, y: 300, width: 100, height: 60)
        button.backgroundColor = UIColor.red
        button.setTitle("Log In", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        return button
    } ()
    
    private let signUpButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: UIScreen.main.bounds.width * 0.5 - 100, y: 300, width: 100, height: 60)
        button.backgroundColor = UIColor.systemPurple
        button.setTitle("Sign Up", for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(signUpClicked), for: .touchUpInside)
       return button
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        headerView.addSubview(headerLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        backgroundColor = UIColor.systemYellow
        addSubviews()
    }
    
    private func addSubviews() {
        addSubview(headerView)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(signUpButton)
    }
    
    @objc private func loginClicked() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text
        else {
            headerLabel.text = "Error"
            return
        }
        delegate?.login(login: login, password: password)
        
    }
    
    @objc private func signUpClicked() {
        delegate?.signUp()
    }
    
    func changeHeaderView(isCorrect: Bool) {
        if isCorrect {
            headerView.backgroundColor = UIColor.green
            headerLabel.text = "Sign in successful"
        } else {
            headerView.backgroundColor = UIColor.red
            headerLabel.text = "Sign in failed"
        }
    }
    
}
