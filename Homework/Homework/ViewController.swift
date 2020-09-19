//
//  ViewController.swift
//  Homework
//
//  Created by Robert Mukhtarov on 19.09.2020.
//  Copyright © 2020 Robert Mukhtarov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AuthorizationRegistrationDelegate {
    var signInView: SignInView!
    var signUpView: SignUpView!
    
    var users = ["admin": "123456", "user1": "qwerty"]

    override func viewDidLoad() {
        super.viewDidLoad()
        if let signInView = UINib.loadFirstObject(from: "SignIn") as? SignInView {
            view.addSubview(signInView)
            signInView.center = view.center
            signInView.delegate = self
            self.signInView = signInView
        }
        if let signUpView = UINib.loadFirstObject(from: "SignUp") as? SignUpView {
            view.addSubview(signUpView)
            signUpView.center = view.center
            signUpView.delegate = self
            signUpView.isHidden = true
            self.signUpView = signUpView
        }
    }
    
    func switchToSignIn() {
        signUpView.isHidden = true
        signInView.isHidden = false
    }
    
    func switchToSignUp() {
        signInView.isHidden = true
        signUpView.isHidden = false
    }
    
    func isUserDataCorrect(login: String, password: String) -> Bool {
        guard let correctPassword = users[login] else { return false }
        return password == correctPassword
    }
    
    func addNewUser(login: String, password: String) {
        users[login] = password
    }
    
    func doesUserExist(login: String) -> Bool {
        return users[login] != nil
    }
}

extension UINib {
    static func loadFirstObject(from nibName: String) -> Any? {
        return UINib(nibName: nibName, bundle: nil).instantiate(withOwner: nil, options: nil).first
    }
}
