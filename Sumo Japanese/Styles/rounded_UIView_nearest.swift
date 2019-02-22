//
//  rounded_UIView_nearest.swift
//  Sumo Japanese
//
//  Created by imac on 6/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class rounded_UIView_nearest: UIView {

    override func didMoveToWindow() {
        self.layer.backgroundColor = UIColor.black.cgColor
        self.layer.cornerRadius = 17
        //self.layer.masksToBounds = true // esto hace que enmascare el contenido
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.darkGray.cgColor
    }

}
