//
//  ViewController.swift
//  AuthorizationRegistration
//
//  Created by Руслан Ахмадеев on 21.09.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var users = ["Admin" : "qwerty"]
    
    private let authorizationForm: AuthorizationFormView = {
        let form = AuthorizationFormView()
        form.translatesAutoresizingMaskIntoConstraints = false
        return form
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewControllerDidLoad")
        view.backgroundColor = .darkGray
        view.addSubview(authorizationForm)
        setupAuthorizationLayout()
    }
    
    private func setupAuthorizationLayout() {
        authorizationForm.delegate = self
        authorizationForm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        authorizationForm.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
        authorizationForm.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50).isActive = true
    }
}

extension ViewController: AuthorizationFormDelegate {
    
    func identifyUser(_ name: String, password: String) {
         guard let currentPassword = users[name] else {
            authorizationForm.statusView.currentStatus = .fail
            print("user doesnt exist")
            return
         }
        
        guard currentPassword == password else {
            authorizationForm.statusView.currentStatus = .fail
            print("incorrect password")
            return
        }
               
        print("Success!!!!")
        authorizationForm.statusView.currentStatus = .success

    }
    
    func registerUser(_ name: String, password: String) {
        users[name] = password
        print("user added")
    }
}

