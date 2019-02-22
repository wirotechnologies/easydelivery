//
//  dotLineUIView.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class dotLineUIView: UIView {

    override func didMoveToWindow() {
        self.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "dot"))
    }

}
