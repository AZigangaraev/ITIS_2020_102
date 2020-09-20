//
//  ViewController.swift
//  RegistrationApp
//
//  Created by Rishat on 17.09.2020.
//  Copyright © 2020 Rishat Latypov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewDelegate, RegistrViewDelegate {
    
    @IBOutlet weak var statusField: UILabel!
    @IBOutlet weak var statusView: UIView!
    
    var loginAndPasswordDictionary: [String: String] = ["rishatl": "1234"]
    
    func validate(login: String, password: String) {
        if(login == "" && password == ""){
            statusView.backgroundColor = .gray
            statusField.text = "Need to sign in to continue"
        } else if(password == loginAndPasswordDictionary[login]){
            statusView.backgroundColor = .green
            statusField.text = "Sign in successful"
            statusField.textAlignment = .center
        } else if(password != loginAndPasswordDictionary[login]){
            statusView.backgroundColor = .red
            statusField.text = "Sign in failed"
            statusField.textAlignment = .center
        }
    }
    
    func hideLoginView() {
       loginView.isHidden = true
       registrView.isHidden = false
    }
    
    @IBOutlet weak var loginView: LoginViewClass!
    @IBOutlet weak var registrView: RegistrationViewClass!
    
    @IBOutlet weak var loginBut: UIButton!
    @IBOutlet weak var signupBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBut.layer.cornerRadius = 10
        signupBut.layer.cornerRadius = 10
        
        registrView.isHidden = true
        registrView.layer.cornerRadius = 30
        registrView.delegateRegistr = self 
        
        loginView.layer.cornerRadius = 30
        loginView.delegateLogin = self
        
        statusView.layer.cornerRadius = 30
    }

    func registr(login: String, password: String) {
        loginAndPasswordDictionary[login] = password
    }
    
    func hideRegistrView(){
        registrView.isHidden = true
        loginView.isHidden = false
    }
}
