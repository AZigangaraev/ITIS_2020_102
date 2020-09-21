//
//  Status.swift
//  lesson2_itis
//
//  Created by Рустем on 21.09.2020.
//  Copyright © 2020 Rustem. All rights reserved.
//

import UIKit
//для статуса авторизации
class Status: UIView {

    @IBOutlet weak var text: UILabel!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "Status", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
