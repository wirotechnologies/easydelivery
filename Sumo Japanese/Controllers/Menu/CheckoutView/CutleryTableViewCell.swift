//
//  CutleryTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class CutleryTableViewCell: UITableViewCell {

    @IBOutlet weak var switchCutlery: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func didMoveToWindow() {
        super.awakeFromNib()
        //let backgroundView = UIView()
        //backgroundView.backgroundColor = UIColor.clear
        //self.selectedBackgroundView = backgroundView
        self.switchCutlery.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0)
        self.switchCutlery.layer.cornerRadius = 15
        self.switchCutlery.layer.masksToBounds = true
        self.switchCutlery.layer.borderWidth = 1
        self.switchCutlery.layer.borderColor = UIColor.white.cgColor
    }
    
}
