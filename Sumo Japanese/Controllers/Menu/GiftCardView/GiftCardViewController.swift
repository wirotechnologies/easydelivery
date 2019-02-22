//
//  GiftCardViewController.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class GiftCardViewController: UIViewController {

    @IBAction func addGiftCardButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
