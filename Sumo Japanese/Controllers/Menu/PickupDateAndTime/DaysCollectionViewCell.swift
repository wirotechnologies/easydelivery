//
//  DaysCollectionViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 12/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class DaysCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var todayTomorrowLabel: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var dayNumber: UILabel!
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var viewState: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCalendar(month: String, dayNumber: String, dayName: String, index: Int){
        self.month.text = month
        self.dayNumber.text = dayNumber
        self.dayName.text = dayName
        switch index {
        case 0:
            todayTomorrowLabel.text = "Today"
        case 1:
            todayTomorrowLabel.text = "Tomorrow"
        default:
            todayTomorrowLabel.text = ""
        }
    }
    
    func setSelected(selected: Bool){
        print(selected)
        switch selected {
        case true:
            viewState.layer.borderColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0).cgColor
            print(viewState.layer.borderColor as Any)
            print("entra al true")
        default:
            viewState.layer.borderColor = UIColor.clear.cgColor
            print("no lo está pintando transparente")
        }
    }
    

}
