//
//  UICartViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/18/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class UIMenuViewController: UIViewController {


    
    public func loadItemsNumBadge() {
        if let datase = UserDefaults.standard.value(forKey:"cart") as? Data {
            var cart = Cart()
            cart = try! PropertyListDecoder().decode(Cart.self, from: datase)
            if(cart.numItems > 0)
            {
                let rightBarButton = navigationItem.rightBarButtonItem as! UIBadgeBarButtonItem
                rightBarButton.badgeNumber = cart.numItems
            }
        }
    }


}
