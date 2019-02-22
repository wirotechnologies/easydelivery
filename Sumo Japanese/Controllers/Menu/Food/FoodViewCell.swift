//
//  FoodViewCell.swift
//  AppRestaurants
//
//  Created by Wilman Rojas on 11/26/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class FoodViewCell: UITableViewCell {

    
    @IBOutlet weak var foodIngredientTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setTitle(text: String){
        self.foodIngredientTitle.text = text
    }
    
    override func didMoveToWindow() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = backgroundView
    }
//    func setDescription(text: String){
//        self.foodIngredientDescription.text = text
//    }
}
