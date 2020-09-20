//
//  ViewController.swift
//  NikitaSosyukHomework
//
//  Created by Nikita Sosyuk on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SignUpDelegate, SignInDelegate {
    
    @IBOutlet private var signInView: SignInUIView!
    @IBOutlet private var signUpView: SignUpUIView!

    private var dictionary: [String: String] = ["admin": "qwerty", "Nikita": "Sosyuk"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.load()
        //тут сразу подгружаю view регистрации, потому что, если вызывать позже, то видно как меняется title у кнопок
        signUpView.load()
        signUpView.isHidden = true
        signInView.delegate = self
        signUpView.delegate = self
    }

    func changeToSignUp() {
        signInView.isHidden = true
        signUpView.isHidden = false
        signUpView.load()
    }
    
    func validateData(username: String?, password: String?) {
        if let u = username, let p = password {
            if (dictionary[u] == p) {
                signInView.succesful()
            } else {
                signInView.failed()
            }
        } else {
            signInView.failed()
        }
    }
    
    func changToSignIn() {
        signInView.isHidden = false
        signUpView.isHidden = true
        signInView.loadAfterSingUp()
    }
    
    func addData(username: String, password: String) {
        dictionary[username] = password
        print("add")
    }

}

