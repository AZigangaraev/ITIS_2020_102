//
//  AuthorizationDelegate.swift
//  Homework
//
//  Created by Robert Mukhtarov on 19.09.2020.
//  Copyright © 2020 Robert Mukhtarov. All rights reserved.
//

import UIKit

protocol AuthorizationRegistrationDelegate: AnyObject {
    func switchToSignIn()
    func switchToSignUp()
    func isUserDataCorrect(login: String, password: String) -> Bool
    func addNewUser(login: String, password: String)
    func doesUserExist(login: String) -> Bool
}
