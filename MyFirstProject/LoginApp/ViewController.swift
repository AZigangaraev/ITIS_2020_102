//
//  ViewController.swift
//  LoginApp
//
//  Created by Albert Ahmadiev on 19.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit


class ViewController: UIViewController, LoginViewDelegate, SignUpDelegate {
    
    @IBOutlet weak var signInView: LoginView!
    @IBOutlet weak var signUpView: SignUpView!
    
    private var users: [String: String] = ["admin": "qwerty"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInView.delegateLogin = self
        signUpView.delegateSignUp = self
        signUpView.isHidden = true
        loadViews()
    }
    
    private func loadViews(){
        makeGradient()
        loadSignInView()
        loadSignUpView()
    }
    
    private func loadSignInView(){
        signInView.layer.cornerRadius = 20
        signInView.signInButton.layer.cornerRadius = 10
        signInView.checkingView.layer.cornerRadius = 20
    }
    
    private func loadSignUpView(){
        signUpView.layer.cornerRadius = 20
        signUpView.signUpButton.layer.cornerRadius = 10
    }

    private func makeGradient(){
        
        let color1 = UIColor(red: 153 / 255, green: 26/255, blue: 61/255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 243 / 255, green: 155/255, blue: 51/255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    
    }
    
    func validate(username: String, password: String) {
        if users[username] == password{
            signInView.checkingView.label.text = "Sign in successful"
            signInView.checkingView.backgroundColor = UIColor.green
        }else {
            signInView.checkingView.label.text = "Sign in failed"
            signInView.checkingView.backgroundColor = UIColor.red
        }
        signInView.usernameField.text = ""
        signInView.passwordField.text = ""
    }
    
    func validate(username: String, password: String, confirmPassword: String) {
        if password == confirmPassword && password != ""{
            users[username] = password
            hideSignIn()
        }else {
            signUpView.usernameField.text = ""
            signUpView.passwordField.text = ""
            signUpView.confirmPasswordField.text = ""
            print("Failed: password != confirm password")
        }
    }
    
    func hideSignIn() {
        signInView.isHidden = true
        signUpView.isHidden = false
        signUpView.usernameField.text = ""
        signUpView.passwordField.text = ""
        signUpView.confirmPasswordField.text = ""
    }
    
    func hideSignUp() {
        signInView.isHidden = false
        signUpView.isHidden = true
        signInView.checkingView.backgroundColor = .lightGray
        signInView.checkingView.label.text = "Sign in to continue"
        signInView.usernameField.text = ""
        signInView.passwordField.text = ""
    }
    
}

