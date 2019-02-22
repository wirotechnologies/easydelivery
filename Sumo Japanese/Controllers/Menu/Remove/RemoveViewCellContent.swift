//
//  RemoveViewCellContent.swift
//  Sumo Japanese
//
//  Created by imac on 28/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

protocol RemoveCellDelegate {
    func setSwitchState(state: Bool, name: Int, section: Int)
}

class RemoveViewCellContent: UITableViewCell {

    var index : IndexPath?
    var delegate: RemoveCellDelegate?
    
    @IBOutlet weak var imgIngredient: UIImageView!
    @IBOutlet weak var ingredientPriceLabel: UILabel!
    @IBOutlet weak var ingredientNameLabel: UILabel!
    
    @IBOutlet weak var switchRemoveComponent: UISwitch!
    
    @IBAction func switchRemove(_ sender: UISwitch) {
        var switchState : Bool = self.switchRemoveComponent.isOn
        delegate?.setSwitchState(state: switchState, name: (index?.row)! - 1, section: (index?.section)!)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func didMoveToWindow() {
        super.awakeFromNib()
        self.switchRemoveComponent.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0)
        self.switchRemoveComponent.layer.cornerRadius = 15
        self.switchRemoveComponent.layer.masksToBounds = true
        self.switchRemoveComponent.layer.borderWidth = 1
        self.switchRemoveComponent.layer.borderColor = UIColor.white.cgColor
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setSwitch(state: Bool){
        self.switchRemoveComponent.isOn = state
    }
    
    func setLabel(text: String){
        self.ingredientNameLabel.text = text
    }
}
