//
//  itemCarViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 28/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ItemCartViewCell: UITableViewCell {

    @IBOutlet var itemImage: UIImageView!
    @IBOutlet weak var dishNameAndQty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(title: String){
        print("si entra acá")
        self.dishNameAndQty.text = title
        print("si entra acá pero no acá")
    }
    
    func setImage(image: UIImage){
        self.itemImage.image = image
    }

    override func didMoveToWindow() {
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        self.selectedBackgroundView = backgroundView
    }
    
}
