//
//  ScheduleTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 13/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    
    var labelsToRender : [UILabel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelsToRender = [dayLabel, hourLabel]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLabels(text: String, label: Int){
        labelsToRender[label].text = text
    }
    
}
