//
//  roundedButton.swift
//  Sumo Japanese
//
//  Created by imac on 5/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class roundedButton: UIButton {
    override func didMoveToWindow() {
        self.layer.cornerRadius = 8
        if self.isEnabled == false {
            self.layer.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:0.3).cgColor
        } else {
            self.layer.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0).cgColor
        }
    }
}
