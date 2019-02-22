//
//  TitleAddTableViewCell.swift
//  Sumo Japanese
//
//  Created by imac on 31/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

protocol DetailCellDelegate {
    func didTapWatchNow(goTo: String)
}

class TitleTableViewCell: UITableViewCell {

    var delegate: DetailCellDelegate?
    
    @IBOutlet weak var titleOfTable: UILabel!
    
    @IBAction func editThisTitleTable(_ sender: Any) {
        var viewToShow = self.titleOfTable.text
        delegate?.didTapWatchNow(goTo: viewToShow!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setTitle(text: String){
        self.titleOfTable.text = text
    }
    
}
