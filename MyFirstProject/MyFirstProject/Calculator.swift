//
//  Calculator.swift
//  MyFirstProject
//
//  Created by Amir Zigangaraev on 14.09.2020.
//  Copyright © 2020 Amir Zigangaraev. All rights reserved.
//

import UIKit

protocol CalculatorViewDelegate: AnyObject {
    func multiply(x: Int, by y: Int)
    func sum(x: Int, with y: Int)
}

class CalculatorView: UIView {
    let firstNumberTextField = UITextField()
    let secondNumberTextField = UITextField()
    let plusButton = UIButton(type: .system)
    let multiplyButton = UIButton(type: .system)
    
    weak var delegate: CalculatorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        [firstNumberTextField, secondNumberTextField, plusButton,
        multiplyButton].forEach { addSubview($0) }
        
        plusButton.setTitle("+", for: .normal)
        multiplyButton.setTitle("*", for: .normal)
        plusButton.addTarget(self, action: #selector(plusTap), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(multiplyTap), for: .touchUpInside)
        plusButton.titleLabel?.font = .systemFont(ofSize: 30)
        multiplyButton.titleLabel?.font = .systemFont(ofSize: 30)
        firstNumberTextField.backgroundColor = UIColor.yellow.withAlphaComponent(0.3)
        secondNumberTextField.backgroundColor = UIColor.green.withAlphaComponent(0.3)
    }
    
    @objc private func plusTap() {
        guard
            let first = firstInt,
            let second = secondInt
        else { return }
        
        delegate?.sum(x: first, with: second)
    }
    
    @objc private func multiplyTap() {
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = frame.size
        firstNumberTextField.frame = CGRect(
            origin: CGPoint(x: 0, y: 0),
            size: CGSize(width: size.width, height: 25)
        )
        secondNumberTextField.frame = CGRect(
            origin: CGPoint(x: 0, y: 30),
            size: CGSize(width: size.width, height: 25)
        )
        plusButton.frame = CGRect(
            origin: CGPoint(x: 0, y: 60),
            size: CGSize(width: size.width * 0.5 - 5, height: 25)
        )
        multiplyButton.frame = CGRect(
            origin: CGPoint(x: size.width * 0.5, y: 60),
            size: CGSize(width: size.width * 0.5, height: 25)
        )
    }
}
