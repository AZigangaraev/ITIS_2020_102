//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Amir Zigangaraev on 14.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

/*
NSObject
UIResponder: NSObject
UIView: UIResponder
*/

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var helloLabel: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var textField: UITextField!
    @IBOutlet var someView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel.frame.size.width = 400
        helloLabel.text = "Hello, class"
        button.setTitle("Say hello", for: UIControl.State.normal)
        button.frame.size.width = 200
        button.addTarget(self, action: #selector(buttonTap), for: .touchDown)
        
        someView.removeFromSuperview()
        let newView = MyCorneredView(frame: someView.frame)
        newView.cornerRadius = 10
        someView = newView
        
        view.addSubview(someView)
    }
    
    @objc func buttonTap() {
        helloLabel.text = "Button tap \(Int.random(in: 1...100))"
        textField.placeholder = helloLabel.text
        
        switch textField.text {
        case "":
            someView.backgroundColor = nil
        case "red":
            someView.backgroundColor = .red
        case "blue", "purple":
            someView.backgroundColor = .blue
        case "green":
            someView.backgroundColor = .green
        case "hide":
            helloLabel.isHidden = true
        case "show":
            helloLabel.isHidden = false
        default:
            someView.backgroundColor = .black
        }
    }
}

