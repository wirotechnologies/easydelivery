//
//  circleRedSelectedUIView.swift
//  Sumo Japanese
//
//  Created by imac on 18/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class circleRedSelectedUIView: UIView {

    override func didMoveToWindow() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 1
//        self.layer.borderColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0).cgColor
        //self.layer.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0).cgColor
    }

}
