//
//  RegistrationViewClass.swift
//  RegistrationApp
//
//  Created by Rishat on 17.09.2020.
//  Copyright © 2020 Rishat Latypov. All rights reserved.
//

import UIKit

protocol RegistrViewDelegate: AnyObject {
    func registr(login: String, password: String)
    func hideRegistrView()
}

class RegistrationViewClass: UIView {
    
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    @IBOutlet var passwordConfirmField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    weak var delegateRegistr: RegistrViewDelegate?
    
    @IBAction func registrAction(_ sender: Any) {
        if(passwordField.text == passwordConfirmField.text){
            delegateRegistr?.registr(login: nameField.text!, password: passwordField.text!)
            delegateRegistr?.hideRegistrView()
        } else {
            print("Error in password confirmation")
        }
    }
    
    @IBAction func signInAction(_ sender: Any) {
        delegateRegistr?.hideRegistrView()
    }
}
