//
//  AuthorizationForm.swift
//  Authorization
//
//  Created by Руслан Ахмадеев on 21.09.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import UIKit

protocol AuthorizationFormDelegate: class {
    func identifyUser(_ name: String, password: String)
    func registerUser(_ name: String, password: String)
}

enum AuthorizationState {
    case signIn
    case signUp
}

class AuthorizationFormView: UIView {
    
    private var currentState: AuthorizationState = .signIn {
        didSet {
            switch currentState {
            case .signIn:
                textLabel.text = "Have no account?"
                bottomButton.setTitle("Login", for: .normal)
                topButton.setTitle("Sign Up", for: .normal)
                confirmPasswordField.isHidden = true
                statusView.isHidden = false
                statusView.currentStatus = .initial
            case .signUp:
                textLabel.text = "Already signed up?"
                bottomButton.setTitle("Sign Up", for: .normal)
                topButton.setTitle("Sign In", for: .normal)
                confirmPasswordField.isHidden = false
                statusView.isHidden = true
            }
            clearFields()
        }
    }
    
    weak var delegate: AuthorizationFormDelegate?
    
    // MARK: - Status View
    
    let statusView: StatusView = {
        let view = StatusView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Text Fields

    private let loginField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        field.layer.cornerRadius = 5
        field.placeholder = "login"
        field.font = .systemFont(ofSize: 17)

        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        field.layer.cornerRadius = 5
        field.placeholder = "password"
        field.font = .systemFont(ofSize: 17)
        field.isSecureTextEntry = true
        
        return field
    }()
    
    private let confirmPasswordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        field.layer.cornerRadius = 5
        field.placeholder = "confirm password"
        field.font = .systemFont(ofSize: 17)
        field.isSecureTextEntry = true
        field.isHidden = true
        return field
    }()
    
    // MARK: - Buttons
    
    private let bottomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .vertical)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentHuggingPriority(.required, for: .vertical)
        button.addTarget(self, action: #selector(bottomButtonTapped), for: .touchDown)
        return button
    }()
    
    private let topButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(topButtonTapped), for: .touchDown)
        return button
    }()
    
    // MARK: - Labels
    
    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Have no account?"
        label.textColor = #colorLiteral(red: 0.1578614116, green: 0.1858559549, blue: 0.246773988, alpha: 1)
        label.font = .systemFont(ofSize: 14)
        label.sizeToFit()
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Stacks
    
    private let textFieldsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 1, green: 0.9503514171, blue: 1, alpha: 1)
        self.layer.cornerRadius = 15
        layer.masksToBounds = true
        
        setupTopStack()
        setupTextFeildsStack()
        setupBottomButton()
        setupStatusView()
        
        currentState = .signIn
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Layout Actions
    
    private func setupTopStack() {
        addSubview(topStack)
        topStack.addArrangedSubview(textLabel)
        topStack.addArrangedSubview(topButton)
        
        topStack.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        topStack.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 10).isActive = true
        topStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    private func setupTextFeildsStack() {
        addSubview(textFieldsStack)
        textFieldsStack.addArrangedSubview(loginField)
        textFieldsStack.addArrangedSubview(passwordField)
        textFieldsStack.addArrangedSubview(confirmPasswordField)
        
        textFieldsStack.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textFieldsStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        textFieldsStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        
    }
    
    private func setupBottomButton() {
        addSubview(bottomButton)
        bottomButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bottomButton.topAnchor.constraint(equalTo: textFieldsStack.bottomAnchor, constant: 30).isActive = true
        bottomButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupStatusView() {
        addSubview(statusView)
        statusView.topAnchor.constraint(equalTo: bottomButton.bottomAnchor, constant: 40).isActive = true
        statusView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        statusView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        statusView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        statusView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Button's actions
    
    @objc private func bottomButtonTapped() {
        
        guard let login = loginField.text, !login.isEmpty else {
            statusView.currentStatus = .fail
            print("login field is empty")
            return
        }
        
        guard let password = passwordField.text, !password.isEmpty else {
            statusView.currentStatus = .fail
            print("password field is empty")
            return
        }
        
        switch currentState {
        case .signIn:
            delegate?.identifyUser(login, password: password)
        case .signUp:
            guard let confirmedPassword = confirmPasswordField.text, !confirmedPassword.isEmpty else {
                print("confirm password field is empty")
                return
            }
            guard confirmedPassword == password else {
                print("password != confirmed password")
                return
            }
            delegate?.registerUser(login, password: password)
        }
            
    }
    
    @objc func topButtonTapped() {
        switch currentState {
        case .signIn:
            currentState = .signUp
        case .signUp:
            currentState = .signIn
        }
    }
    
    // MARK: - HelperMethods
    
    private func clearFields() {
        loginField.text = ""
        passwordField.text = ""
        confirmPasswordField.text = ""
    }
}
