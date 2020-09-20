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
    let registerButton = UIButton(type: .system)

    var loginViewShowing = true

    let loginView: LoginView = LoginView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 300, height: 400)))
    let registerView: RegisterView = getRegisterViewFromNib()
    let statusText = UILabel()
    
    func initializeBox() -> UIView {
        let boxWidth = self.view.frame.size.width * 0.75
        let boxHeight = self.view.frame.size.height * 0.60

        let coordX = (self.view.frame.size.width - boxWidth) / 2
        let coordY = (self.view.frame.size.height - boxHeight) * 0.30

        let box = UIView(frame: CGRect(x: coordX, y: coordY, width: boxWidth, height: boxHeight))

        statusText.frame = CGRect(x: coordX, y: coordY - 50, width: boxWidth, height: 50)

        statusText.text = "Need to sign in to continue"
        statusText.textAlignment = .center
        statusText.font = UIFont(name: "CustomFont", size: 42)
        statusText.textColor = UIColor.gray

        view.addSubview(statusText)

        box.backgroundColor = UIColor.gray.withAlphaComponent(0.25)

        return box
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLoginView()
    }

    func setUpLoginView() {
        let buttonY = box.frame.maxY + 15
        let buttonWidth = CGFloat(80)
        let buttonHeight = CGFloat(40)
        let loginButtonX = box.frame.minX
        let registerButtonX = box.frame.maxX - buttonWidth

        loginButton.frame = CGRect(x: loginButtonX, y: buttonY, width: buttonWidth, height: buttonHeight)
        registerButton.frame = CGRect(x: registerButtonX, y: buttonY, width: buttonWidth, height: buttonHeight)

        loginButton.setTitle("Login", for: UIControl.State())
        registerButton.setTitle("Register", for: UIControl.State())

        loginButton.addTarget(self, action: #selector(loginButtonTap), for: .touchDown)
        registerButton.addTarget(self, action: #selector(registerButtonTap), for: .touchDown)

        [loginButton, registerButton].forEach {
            $0.backgroundColor = UIColor.blue.withAlphaComponent(0.32)
        }

        view.addSubview(loginButton)
        view.addSubview(registerButton)
        view.addSubview(box)

        box.addSubview(loginView)
    }

    func setUpRegisterView() {
        box.addSubview(registerView)
    }

    @objc func loginButtonTap() {
        if loginViewShowing {
            if (loginView.signIn()) {
                showAlertWithDistructiveButton(title: "Succesful logging", message: "Welcome")
                statusText.textColor = .green
                statusText.text = "Sign in successful"
            } else {
                statusText.textColor = .red
                statusText.text = "Sign in failed"
                showAlertWithDistructiveButton(title: "Failed to log in", message: "Make sure that you have typed Login / Password correctly")
            }
        } else {
            loginViewShowing = true
            cleanBox()
            setUpLoginView()
        }
    }

    @objc func registerButtonTap() {
        if loginViewShowing {
            loginViewShowing = false
            cleanBox()
            setUpRegisterView()
        } else {
            if (registerView.registerUser()) {
                cleanBox()
                setUpLoginView()
                loginViewShowing = true
                
                statusText.text = "Welcome"
                statusText.textColor = .green
                
                showAlertWithDistructiveButton(title: "Successful registration", message: "Congrats...")
            } else {
                showAlertWithDistructiveButton(title: "Failed to register", message: "Failed to register - too many reasons")
            }
        }
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
