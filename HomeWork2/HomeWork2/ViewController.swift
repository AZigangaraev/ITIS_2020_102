//
//  ViewController.swift
//  HomeWork2
//
//  Created by Nail on 20.09.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginDelegate, registrationViewDelegate{
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var loginView: UIView!
    
    var Dictionary: [String: String] = ["admin": "qwerty"]
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    func correct(login: String, password: String) {
        if login == "" || password == ""{
            statusLabel.text = "Need to sign in to continue"        
            statusView.backgroundColor = .lightGray
        } else {
            if (Dictionary[login] == password){
                statusLabel.text = "Sign in successful"
                statusView.backgroundColor = .green
            } else {
                statusLabel.text = "Wrong data"
                statusView.backgroundColor = .red
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func loginViewIsHidden(){
            loginView.isHidden = true
            registrationView.isHidden = false
        }
    func registrationViewIsHidden(){
        registrationView.isHidden = true
        loginView.isHidden = false
    }
        
    
    func registration(login: String, password: String) {
        Dictionary[login] = password
    }


}

