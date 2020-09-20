//
//  ThisIsRegistrationView.swift
//  HomeWork2
//
//  Created by Nail on 20.09.2020.
//  Copyright © 2020 Nail. All rights reserved.
//

import UIKit
protocol registrationViewDelegate: AnyObject{
    func registration(login: String, password: String)
    func registrationViewIsHidden()
}
class ThisIsRegistrationView: UIView {

    @IBOutlet weak var passwordT: UITextField!
    
    @IBOutlet weak var loginT: UITextField!
    // @IBAction func signInButton(_ sender: Any) {
   // }
    @IBOutlet weak var alreadyLabel: UILabel!
    @IBOutlet weak var confirmT: UITextField!
    @IBAction func registrationButton(_ sender: Any) {
        registrationDelegate?.registrationViewIsHidden()
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        if(passwordT.text == confirmT.text){
            registrationDelegate?.registration(login: loginT.text!, password: passwordT.text!)
                      registrationDelegate?.registrationViewIsHidden()
            
        } else {
            print("Error")
        }
    }
    @IBAction func signInButton(_ sender: Any) {
        registrationDelegate?.registrationViewIsHidden()
        alreadyLabel.isHidden = true
        
    }
    weak var registrationDelegate: registrationViewDelegate?
    
}
