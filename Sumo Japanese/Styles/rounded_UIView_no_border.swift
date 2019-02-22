//
//  rounded_UIView_no_border.swift
//  Sumo Japanese
//
//  Created by imac on 5/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class rounded_UIView_no_border: UIView {

    override func didMoveToWindow() {
        self.layer.cornerRadius = 8
    }

}
