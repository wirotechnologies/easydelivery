//
//  rounded_textView.swift
//  Sumo Japanese
//
//  Created by imac on 5/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class rounded_textField: UITextField {

    override func didMoveToWindow() {
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.backgroundColor = UIColor.black.cgColor
    }
    
}
