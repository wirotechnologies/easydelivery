//
//  ContentTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 31/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredientPriceContent: UILabel!
    @IBOutlet weak var IngredientNameContent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setName(text : String){
        self.IngredientNameContent.text = text
    }
    
    func setPrice(text : String){
        self.ingredientPriceContent.text = text
    }
}
