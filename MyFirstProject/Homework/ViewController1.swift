//
//  ViewController.swift
//  Homework
//
//  Created by Эвелина on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//


import UIKit
class ViewController1: UIViewController,AuthorizationDelegate,RegistrationDelegate {
    
    func signUpTap() {
        signInView.isHidden = true
        signUpView.isHidden = false
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.delegate = self
        signUpView.delegate = self
        signUpView.isHidden = false
    }
    
    func available(username: String, password: String) {
        var isCorrect: Bool
        if users[username] == password {
            isCorrect = true
            signInView.statusView.backgroundColor = .green
            signInView.statusLabel.text = "Sign in successful"
        } else {
            isCorrect = false
            signInView.statusView.backgroundColor = .red
            signInView.statusLabel.text = "Sign in failed"
        }
        available3(isCorrect: isCorrect)
    }
    func available3(isCorrect:Bool) {
        if isCorrect{
            signInView.statusView.backgroundColor = .green
            signInView.statusLabel.text = "Sign up successful"
        }else {
            signInView.statusView.backgroundColor = .red
            signInView.statusLabel.text = "Sign up failed"        }
    }
    func available2(username: String, password: String, confirmPassword: String) {
     var isCorrect:Bool
        if confirmPassword == password{
            signUpView.isHidden = true
            isCorrect = true
            users[username] = password
        }else {
            isCorrect = false
            print("Sign up failed")
            signUpView.statusViewUp.backgroundColor = .red
            signUpView.statusViewLabel.text = "Need to sign in to continue"
        }
        changed(changes: isCorrect)
    }
    func changed(changes:Bool){
        if changes{
            signUpView.isHidden = true
            signInView.isHidden = false
        }
    }
    
    @IBOutlet weak var signInView: AuthorizationView!
    @IBOutlet weak var signUpView: RegistrationView!
    
    
private var users: [String: String] = ["A": "123"]
}
