//
//  ImageAndTextTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 22/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ImageAndTextTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(imageName: String){
        self.imageProduct.image = UIImage(named: imageName)
    }
    func setTitle(title: String){
        self.title.text = title
    }
    func setPrice(price: String){
        self.price.text = price
    }
    func setTime(time: String){
        self.time.text = time
    }
}
