//
//  rounded_UIView_Gift_Card.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class rounded_UIView_Gift_Card: UIView {

    override func didMoveToWindow() {
        //self.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0)
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 8
        self.layer.borderColor = UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0).cgColor
    }

}
