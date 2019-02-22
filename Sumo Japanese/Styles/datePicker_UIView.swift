//
//  datePicker_UIView.swift
//  Sumo Japanese
//
//  Created by imac on 15/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class datePicker_UIView: UIView {

    override func didMoveToWindow() {
        //self.backgroundColor = UIColor(red:0.44, green:0.44, blue:0.44, alpha:0.5)
        self.layer.cornerRadius = 8
        //self.layer.masksToBounds = true // esto hace que enmascare el contenido
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor(red:0.91, green:0.91, blue:0.91, alpha:1.0).cgColor
    }

}
