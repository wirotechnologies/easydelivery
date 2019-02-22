//
//  ButtonTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconButton: UIImageView!
    @IBOutlet weak var textButton: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTextButton(title: String){
        textButton.text = title
    }
    
    func setImage(img: UIImage){
        iconButton.image = img
    }
    
}
