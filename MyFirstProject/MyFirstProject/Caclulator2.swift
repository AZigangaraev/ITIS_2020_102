//
//  Calculator.swift
//  MyFirstProject
//
//  Created by Amir Zigangaraev on 14.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

class Calculator2View: UIView {
    @IBOutlet private var firstNumberTextField: UITextField!
    @IBOutlet private var secondNumberTextField: UITextField!
    @IBOutlet private var plusButton: UIButton!
    @IBOutlet private var multiplyButton: UIButton!
    
    weak var delegate: CalculatorViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    private func setup() {
        firstNumberTextField.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        secondNumberTextField.backgroundColor = UIColor.green.withAlphaComponent(0.3)
    }
    
    @IBAction private func plusTap() {
        guard
            let first = firstInt,
            let second = secondInt
        else { return }
        
        delegate?.sum(x: first, with: second)
    }
    
    @IBAction private func multiplyTap() {
        guard
            let first = firstInt,
            let second = secondInt
        else { return }
        
        delegate?.multiply(x: first, by: second)
    }
    
    var firstInt: Int? {
        if let text = firstNumberTextField.text {
            return Int(text)
        }
        return nil
    }
    
    var secondInt: Int? {
        if let text = secondNumberTextField.text {
            return Int(text)
        }
        return nil
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        let size = frame.size
//        firstNumberTextField.frame = CGRect(
//            origin: CGPoint(x: 0, y: 0),
//            size: CGSize(width: size.width, height: 25)
//        )
//        secondNumberTextField.frame = CGRect(
//            origin: CGPoint(x: 0, y: 30),
//            size: CGSize(width: size.width, height: 25)
//        )
//        plusButton.frame = CGRect(
//            origin: CGPoint(x: 0, y: 60),
//            size: CGSize(width: size.width * 0.5 - 5, height: 25)
//        )
//        multiplyButton.frame = CGRect(
//            origin: CGPoint(x: size.width * 0.5, y: 60),
//            size: CGSize(width: size.width * 0.5, height: 25)
//        )
//    }
}
