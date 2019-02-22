//
//  rounded_UIView.swift
//  Sumo Japanese
//
//  Created by imac on 23/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class rounded_UIView: UIView {

    override func didMoveToWindow() {
        //self.backgroundColor = UIColor(red:0.44, green:0.44, blue:0.44, alpha:0.5)
        self.layer.cornerRadius = 8
        //self.layer.masksToBounds = true // esto hace que enmascare el contenido
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
    }

}
