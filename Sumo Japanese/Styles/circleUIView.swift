//
//  circleUIView.swift
//  Sumo Japanese
//
//  Created by imac on 13/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class circleUIView: UIView {

    override func didMoveToWindow() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        //self.layer.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0).cgColor
    }

}
