//
//  containerDayUIView.swift
//  Sumo Japanese
//
//  Created by imac on 12/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class containerDayUIView: UIView {

    override func didMoveToWindow() {
        //self.layer.backgroundColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0).cgColor
    }

}
