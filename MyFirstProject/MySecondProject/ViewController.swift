//
//  ViewController.swift
//  MySecondProject
//
//  Created by Amir Zigangaraev on 14.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

var users: [String: String] = [
    "admin": "admin"
]

class ViewController: UIViewController {
    lazy var box = initializeBox()

    let loginButton = UIButton(type: .system)
    let goToRegister = UIButton(type: .system)

    var loginViewShowing = true

    let loginView: LoginView = LoginView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 400)))
    let registerView: RegisterView = getRegisterViewFromNib()

    func initializeBox() -> UIView {
        let boxWidth = self.view.frame.size.width * 0.75
        let boxHeight = self.view.frame.size.height * 0.60

        let coordX = (self.view.frame.size.width - boxWidth) / 2
        let coordY = (self.view.frame.size.height - boxHeight) * 0.30

        box = UIView(frame: CGRect(x: coordX, y: coordY, width: boxWidth, height: boxHeight))

        box.backgroundColor = UIColor.gray.withAlphaComponent(0.25)

        return box
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLoginView()
    }

    func setUpLoginView() {
        cleanBox()
        
        let buttonY = box.frame.maxY
        let buttonWidth = CGFloat(100)
        let buttonHeight = CGFloat(40)
        let loginButtonX = box.frame.midX - 100
        let registerButtonX = box.frame.maxX - 165

        loginButton.frame = CGRect(x: loginButtonX, y: buttonY - 300, width: buttonWidth, height: buttonHeight)
        goToRegister.frame = CGRect(x: registerButtonX, y: buttonY - 175, width: buttonWidth, height: buttonHeight)

        loginButton.setTitle("Login", for: UIControl.State())
        goToRegister.setTitle("Register now", for: UIControl.State())

        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchDown)
        goToRegister.addTarget(self, action: #selector(goToRegisterTap), for: .touchDown)

        [loginButton, goToRegister].forEach {
            $0.backgroundColor = UIColor.blue.withAlphaComponent(0.32)
        }

        box.addSubview(loginView)

        box.addSubview(loginButton)
        box.addSubview(goToRegister)

        view.addSubview(box)
    }

    func setUpRegisterView() {
        cleanBox()
        registerView.controller = self
        box.addSubview(registerView)
    }

    @objc func loginButtonTap() {
        if loginViewShowing {
            if (loginView.signIn()) {
                showAlertWithDistructiveButton(title: "Succesful logging", message: "Welcome")
            } else {
                showAlertWithDistructiveButton(title: "Failed to log in", message: "Make sure that you have typed Login / Password correctly")
            }
        } else {
            loginViewShowing = true
            cleanBox()
            setUpLoginView()
        }
    }

    @objc func goToRegisterTap() {
        loginViewShowing = false
        cleanBox()
        setUpRegisterView()
        /*
        if loginViewShowing {
            loginViewShowing = false
            cleanBox()
            setUpRegisterView()
        } else {
            if (registerView.registerUser()) {
                cleanBox()
                setUpLoginView()
                loginViewShowing = true
                
                showAlertWithDistructiveButton(title: "Successful registration", message: "Congrats...")
            } else {
                showAlertWithDistructiveButton(title: "Failed to register", message: "Failed to register - too many reasons")
            }
        }
        */
    }

    func showAlertWithDistructiveButton(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default))

        self.present(alert, animated: true, completion: nil)
    }

    private func cleanBox() {
        for view in self.box.subviews {
            view.removeFromSuperview()
        }
    }
}

fileprivate func getRegisterViewFromNib() -> RegisterView {
    return Bundle.main.loadNibNamed("RegisterView", owner: nil, options: nil)?.first as! RegisterView
}
