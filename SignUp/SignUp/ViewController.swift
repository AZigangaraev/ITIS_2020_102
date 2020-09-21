//
//  ViewController.swift
//  SignUp
//
//  Created by Булат Хабибуллин on 17.09.2020.
//  Copyright © 2020 Bulat Khabibullin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate {
    
    @IBOutlet var statusView: UIView!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet weak var signUpView: SignUpView!
    @IBOutlet weak var signInView: SignInView!
    
    
 
    func switchSignInView() {
        signInView.isHidden = true
        signUpView.isHidden = false
    }
       
    func switchSignUpView() {
        signUpView.isHidden = true
        signInView.isHidden = false
    }
    
    
    func validate(login: String, password: String) {
        if login == "" && password == "" {
            statusView.backgroundColor = .gray
            statusLabel.text = "Need to sign in to continue"
        } else {
            if dictionary[login] == password {
                statusView.backgroundColor = .green
                statusLabel.text = "Sign in succeseful"
            } else {
                if password != dictionary[login] {
                    statusView.backgroundColor = .red
                    statusLabel.text = "Sign in failed"
                }
            }
        }
    }

    
    
    func registration(login: String, password: String) {
        dictionary[login] = password
    }
    
    
    
    
    var dictionary: [String: String] = ["admin": "qwerty"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpView.delegateUp = self
        signInView.delegateIn = self
    }

}

