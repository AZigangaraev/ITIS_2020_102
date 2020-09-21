//
//  ThisIsRegistrationView.swift
//  HomeWork2
//
//  Created by Nail on 20.09.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit
protocol RegistrationViewDelegate: AnyObject{
    func registration(login: String, password: String)
    func registrationViewIsHidden()
}

class RegistrationViewClass: UIView {
    
    weak var registrationDelegate: RegistrationViewDelegate?

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    // @IBAction func signInButton(_ sender: Any) {
   // }
    @IBOutlet weak var alreadyLabel: UILabel!
    @IBOutlet weak var confirmTextField: UITextField!
    //weak var registrationDelegate:registrationViewDelegate?
    
    @IBAction func signUpButton(_ sender: Any) {
        if(passwordTextField.text == confirmTextField.text){
            registrationDelegate?.registration(login: loginTextField.text!, password: passwordTextField.text!)
                      registrationDelegate?.registrationViewIsHidden()
            
        } else {
            print("Error")
        }
    }
    @IBAction func signInButton(_ sender: Any) {
        registrationDelegate?.registrationViewIsHidden()
                
    }
    
}
