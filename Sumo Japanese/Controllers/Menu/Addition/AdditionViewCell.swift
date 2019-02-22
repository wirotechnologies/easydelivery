//
//  AdditionViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 24/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class AdditionViewCell: UITableViewCell {

    @IBOutlet weak var additionLabel: UILabel!
    @IBOutlet weak var additionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(image: UIImage){
        self.additionImage.image = image
    }
    
    func setLabel(text: String){
        self.additionLabel.text = text
    }
}
