//
//  aditionViewCellContent.swift
//  Sumo Japanese
//
//  Created by imac on 25/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class AdditionViewCellContent: UITableViewCell {

    var quantity = 0
    
    @IBOutlet weak var switch_remove: UISwitch!
   // @IBOutlet weak var check_add: UIImageView!
    @IBOutlet weak var ingredientNameLabel: UILabel!

    @IBOutlet weak var number: UILabel!
    
    @IBAction func moreBtn(_ sender: Any) {
        sumar()
    }
    @IBAction func lessBtn(_ sender: Any) {
        restar()
    }
    
    func sumar() -> Int{
        quantity+=1
        self.number.text = String(quantity)
        return quantity
    }
    func restar() -> Int{
        if quantity != 0 {
            quantity-=1
        }
        self.number.text = String(quantity)
        return quantity
    }
    
    override func didMoveToWindow() {
        super.awakeFromNib()
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = backgroundView
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setLabel(text: String){
        self.ingredientNameLabel.text = text
    }
    func showAdd(){
        self.switch_remove.isHidden = true
    }
    /*func showCheck(selected: Bool){
        if selected {
            self.check_add.isHidden = false
        } else {
            self.check_add.isHidden = true
        }
        print(selected)
    }*/
}
