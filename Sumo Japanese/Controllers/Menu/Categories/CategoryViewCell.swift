//
//  CategoryViewCell.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/26/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(image: UIImage){
        self.categoryImage.image = image
    }
    
    func setLabel(text: String){
        self.categoryLabel.text = text
    }
    
}
