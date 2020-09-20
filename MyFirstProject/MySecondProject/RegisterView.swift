//
//  RegisterView.swift
//  MySecondProject
//
//  Created by Joseph on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

class RegisterView: UIView {
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordRepetitionField: UITextField!

    func registerUser() -> Bool {
        guard let login = loginField.text, let password = passwordField.text, let passwordRep = passwordRepetitionField.text else {
            return false
        }

        if users.keys.contains(login) {
            print("User already exists")
        } else if (password.count <= 5) {
            print("Password too short")
        } else if (password != passwordRep) {
            print("Password mismatch")
        } else {
            users[login] = password
            return true
        }
        return false
    }

    func cleanField() {
        [loginField, passwordField, passwordRepetitionField].forEach {
            $0?.text = ""
        }
    }
}
