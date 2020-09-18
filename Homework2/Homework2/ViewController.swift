//
//  ViewController.swift
//  Homework2
//
//  Created by Ruslan Khanov on 16.09.2020.
//  Copyright © 2020 Ruslan Khanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet var authorizationView: UIView!
    @IBOutlet var registrationView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    // MARK: - User interaction

    @IBAction func startAuthorization(sender: UIButton) {
        registrationView.isHidden = true
        authorizationView.isHidden = false
    }
    @IBAction func startRegistration(sender: UIButton) {
        registrationView.isHidden = false
        authorizationView.isHidden = true
    }
}

