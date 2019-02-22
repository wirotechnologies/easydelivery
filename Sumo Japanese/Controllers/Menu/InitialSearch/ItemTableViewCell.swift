//
//  ItemTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 22/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemTime: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setImage(nameImage: String){
        itemImage.image = UIImage(named: nameImage)
    }
    
    func setItemName(nameItem: String){
        itemName.text = nameItem
    }
    func setItemTime(time: String){
        itemTime.text = time
    }
    
}
