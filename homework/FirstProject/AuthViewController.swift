//
//  AuthViewController.swift
//  FirstProject
//
//  Created by Svetlana Safonova on 20.09.2020.
//  Copyright © 2020 Svetlana Safonova. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {
    
    

    var signUp: Bool = true {
        willSet {
            if newValue {
                titleLabel.text = "Registration"
                passwordConfField.isHidden = false
                enterButton.setTitle("Sign In", for: .normal)
                askLabel.text = "Already signed up?"
                checkVIew.isHidden = true
                checkVIew.backgroundColor = UIColor(red: 146/255, green: 145/255, blue: 145/255, alpha: 1.0)
                checkingLabel.text = "Need to sign in to continue"
                signupButton.setTitle("Sign Up", for: .normal)
            } else {
                titleLabel.text = "Authorization"
                passwordConfField.isHidden = true
                enterButton.setTitle("Sign Up", for: .normal)
                askLabel.text = "Have no account?"
                checkVIew.isHidden = false
                signupButton.setTitle("Log In", for: .normal)
            }
        }
    }
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var checkVIew: UIView!
    @IBOutlet weak var checkingLabel: UILabel!
    @IBOutlet weak var usernameFIeld: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordConfField: UITextField!
    @IBOutlet weak var askLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    override func viewDidLoad() {
        checkVIew.isHidden = true
        super.viewDidLoad()
        
        let us = Users()
        
        us.create()
        
        print(us.getUsers())
        
        
       
    }
    
    @IBAction func signUp(_ sender: Any) {
        let user = Users()
        if signUp == true {
            if usernameFIeld.text != "", passwordField.text != "",
                passwordConfField.text != "" {
                if passwordConfField.text == passwordField.text {
                
                let login = usernameFIeld.text!
                let password = passwordField.text!
                user.addUser(username: login, password: password)
                    usernameFIeld.text = ""
                    passwordConfField.text = ""
                    passwordField.text = ""
                } else {
                    print("passwords are not the same")
                }
            } else {
                print("Fields are empty")
            }
        } else {
            if usernameFIeld.text != "", passwordField.text != "" {
                if user.doesExist(username: usernameFIeld.text!, password: passwordField.text!) == true {
                    checkVIew.backgroundColor = UIColor(red: 120/255, green: 255/255, blue: 111/255, alpha: 1.0)
                    checkingLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
                    checkingLabel.text = "Sing in successful"
                    usernameFIeld.text = ""
                    passwordField.text = ""
                }
                else {
                    checkVIew.backgroundColor = UIColor(red: 255/255, green: 74/255, blue: 60/255, alpha: 1.0)
                    checkingLabel.text = "Sign in failed"
                    usernameFIeld.text = ""
                    passwordField.text = ""
                }
            }
        }
    }
    
    @IBAction func loginSwitch(_ sender: Any) {
        signUp = !signUp
    }
    
    

}
