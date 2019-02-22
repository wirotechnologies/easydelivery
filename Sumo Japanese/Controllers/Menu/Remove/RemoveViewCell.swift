//
//  RemoveViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 28/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class RemoveViewCell: UITableViewCell {

    @IBOutlet weak var removeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabel(text: String){
        self.removeLabel.text = text
    }
    
}
