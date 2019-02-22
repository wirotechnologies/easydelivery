//
//  testViewController.swift
//  Sumo Japanese
//
//  Created by imac on 6/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var vie: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       UIView.animate(withDuration: 0.5){
            self.centerImage.frame = CGRect(x: -800, y: 0, width: 100, height: 100)
        }
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
