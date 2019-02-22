//
//  NearestTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 13/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class NearestTableViewCell: UITableViewCell {

    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var firstPartAddressLabel: UILabel!
    @IBOutlet weak var secondPartAddressLabel: UILabel!
    @IBOutlet weak var waitTimeAddressLabel: UILabel!
    
    var labelsToRender : [UILabel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelsToRender = [indexLabel, locationNameLabel, firstPartAddressLabel, secondPartAddressLabel, waitTimeAddressLabel]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLabels(text: String, label: Int){
        labelsToRender[label].text = text
    }
}
