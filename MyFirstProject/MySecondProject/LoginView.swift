//
//  LoginView.swift
//  MySecondProject
//
//  Created by Joseph on 20.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

class LoginView: UIView {
    lazy var loginLabel = UILabel(frame: getDimension(row: 0))
    lazy var login = UITextField(frame: getDimension(row: 1))
    lazy var passwordLabel = UILabel(frame: getDimension(row: 2))
    lazy var password = UITextField(frame: getDimension(row: 3))

    private var elementSpacing = 10

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    func setup() {
        password.isSecureTextEntry = true
        login.autocapitalizationType = .none

        [login, password].forEach {
            $0.backgroundColor = UIColor.white.withAlphaComponent(0.75)
            self.addSubview($0)
        }

        loginLabel.text = "Login"
        passwordLabel.text = "Password"

        [loginLabel, passwordLabel].forEach {
            self.addSubview($0)
        }
    }

    func getDimension(row: Int) -> CGRect {
        let width = self.frame.width * 0.9
        let height = 40
        let coordX = (self.frame.width - width) / 2
        let coordY = elementSpacing + row * (elementSpacing + height)

        return CGRect(x: coordX, y: CGFloat(coordY), width: width, height: CGFloat(height))
    }

    func signIn() -> Bool {
        guard let userLogin = login.text, let userPass = password.text else {
            return false
        }

        return userPass == users[userLogin]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
