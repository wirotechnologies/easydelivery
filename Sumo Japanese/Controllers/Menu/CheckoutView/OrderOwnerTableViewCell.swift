//
//  OrderOwnerTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class OrderOwnerTableViewCell: UITableViewCell {

    @IBOutlet weak var switchOrderOwner: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func didMoveToWindow() {
        super.awakeFromNib()
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = UIColor.clear
//        self.selectedBackgroundView = backgroundView
        self.switchOrderOwner.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0)
        self.switchOrderOwner.layer.cornerRadius = 15
        self.switchOrderOwner.layer.masksToBounds = true
        self.switchOrderOwner.layer.borderWidth = 1
        self.switchOrderOwner.layer.borderColor = UIColor.white.cgColor
    }
    
}
