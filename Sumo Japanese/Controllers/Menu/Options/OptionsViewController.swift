//
//  OptionsViewController.swift
//  Sumo Japanese
//
//  Created by imac on 18/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

struct options{
    var optionName = String()
    var optionIcon = String()
}

class OptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableOptions: UITableView!
    @IBAction func goToLogin(_ sender: Any) {
        performSegue(withIdentifier: "segueFromOptionsToLogin", sender: nil)
    }
    
    var optionsMenu = [options]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsMenu = [
            options(optionName: "Example Option", optionIcon: "icon_options_sample"),
            options(optionName: "Example Option", optionIcon: "icon_options_sample"),
            options(optionName: "Example Option", optionIcon: "icon_options_sample"),
            options(optionName: "Privacy Policy", optionIcon: "icon_options_privacy_policy")
        ]
        let cellNib = UINib(nibName: "OptionsTableViewCell", bundle: nil)
        tableOptions.register(cellNib, forCellReuseIdentifier: "_optionsTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "_optionsTableViewCell") as? OptionsTableViewCell
        cell?.setOption(name: optionsMenu[indexPath.row].optionName, icon: optionsMenu[indexPath.row].optionIcon)
        return (cell!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3{
            performSegue(withIdentifier: "segueFromOptionsToPrivacyPolicy", sender: nil)
        }
    }

}
