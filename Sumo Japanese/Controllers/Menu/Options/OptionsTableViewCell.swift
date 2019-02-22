//
//  OptionsTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 18/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {

    @IBOutlet weak var optionNameLabel: UILabel!
    @IBOutlet weak var iconOptionLabel: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setOption(name: String, icon: String){
        optionNameLabel.text = name
        iconOptionLabel.image = UIImage(named: icon)
    }
    
}
