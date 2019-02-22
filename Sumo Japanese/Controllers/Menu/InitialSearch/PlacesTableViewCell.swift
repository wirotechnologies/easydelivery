//
//  PlacesTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 22/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePlace: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setImage(nameImage: String){
        imagePlace.image = UIImage(named: nameImage)
    }
    
    func setPlaceName(namePlace: String){
        placeName.text = namePlace
    }
    func setPlaceTime(time: String){
        placeTime.text = time
    }
    
}
