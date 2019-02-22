//
//  TitleTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 18/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class TitlePrivacyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var categoryPolicy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setCategory(text: String){
        categoryPolicy.text = text
    }
    
}
