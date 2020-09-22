//
//  ViewController.swift
//  hw2
//
//  Created by Montypass on 20.09.2020.
//

import UIKit

class ViewController: UIViewController,LoginViewDelegate, RegistrationViewDelegate {
    
    private var dictionary: [String: String] = ["admin" : "qwerty", "Emil" : "Kamaliev"]
    
    @IBOutlet var loginView: LoginView!
    @IBOutlet var registrationView: RegistrationView!
    
    
    
    
    
    func register(login: String, password: String) {
        dictionary[login] = password
    }
    
    func validate(login: String, password: String) {
        
        loginView.authorizationStatusView.backgroundColor = .gray
        loginView.authorizationStatusLabel.text = "Need to sign in to continue"
            
        if password == dictionary[login] {
            loginView.authorizationStatusView.backgroundColor = .green
            loginView.authorizationStatusLabel.text = "Sign in successful"
            loginView.authorizationStatusLabel.textAlignment = .center
        } else if password != dictionary[login] {
            loginView.authorizationStatusView.backgroundColor = .red
            loginView.authorizationStatusLabel.text = "Sign in failed"
            loginView.authorizationStatusLabel.textAlignment = .center
        }
    }
    
    func hideRegistrationView() {
        registrationView.isHidden = true;
        loginView.isHidden = false;
    }
    
    func hideLoginView() {
        loginView.isHidden = true
        registrationView.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationView.isHidden = true

        registrationView.delegate = self

        loginView.delegate = self
        
    }
    
}
    
    

