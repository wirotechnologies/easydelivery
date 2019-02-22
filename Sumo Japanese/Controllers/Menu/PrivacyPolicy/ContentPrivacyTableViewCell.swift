//
//  ContentTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 18/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ContentPrivacyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var textContentLabel: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContent(text: String){
        textContentLabel.text = text
    }
}
