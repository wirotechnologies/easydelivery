//
//  HomeViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/18/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var menu: [Dictionary<String, Any>] = [[:]]
    var state_loading: Bool = true
    

    @IBOutlet weak var pickupOutletButton: roundedButton!
    @IBOutlet weak var deliveryOutletButton: roundedButton!
    
    @IBOutlet weak var loadingAnimated: UIActivityIndicatorView!
    @IBAction func locationButton(_ sender: Any) {
        performSegue(withIdentifier: "segueFromHomeToRestaurantDetail", sender: nil)
    }
    
    @IBAction func deliveryButton(_ sender: Any) {
        createAlert(title: "Welcome", message: "Do you want to log in or continue as a guest?")
    }
    
    @IBAction func pickupButton(_ sender: Any) {
        createAlert(title: "Welcome", message: "Do you want to log in or continue as a guest?")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingAnimated.startAnimating()
        loadingAnimated.isHidden = false
        initApp()
        loadMenu()
        if let items = tabBarController?.tabBar.items {
            items[1].isEnabled = false
        }
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Login", style: UIAlertAction.Style.default, handler: {(action) in
            self.performSegue(withIdentifier: "segueToLoginFromHome", sender: nil)
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Guest", style: UIAlertAction.Style.default, handler: {(action) in
            self.performSegue(withIdentifier: "segueToCategoryFromHome", sender: nil)
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func initApp()
    {
        if (UserDefaults.standard.object(forKey: "cart") == nil)
        {
            var cart = Cart()
            cart.numItems = 0
            UserDefaults.standard.setValue(try? PropertyListEncoder().encode(cart), forKey: "cart")
        }
        else
        {
            let datase = UserDefaults.standard.value(forKey:"cart") as? Data
            var cart = Cart()
            cart = try! PropertyListDecoder().decode(Cart.self, from: datase!)
            cart.numItems = cart.numItems + 1
            UserDefaults.standard.setValue(try? PropertyListEncoder().encode(cart), forKey: "cart")
        }

    }
    
    func loadMenu()
    {
        if Network.isConnectedToNetwork(){
            Menus.getMenu(){
                successaa in
                if(successaa.count > 0){
                    if (UserDefaults.standard.object(forKey: "version") != nil){
                        UserDefaults.standard.setValue(1, forKey: "version")
                        let menu_version_local = UserDefaults.standard.object(forKey: "version") as! Int
                        let menu_version_server =  Int(Menus.getVersion(data: successaa))!
                        if(menu_version_local < menu_version_server){
                            self.menu = Menus.getObjects(data: successaa)
                            UserDefaults.standard.setValue(successaa, forKey: "menu")
                            UserDefaults.standard.setValue(menu_version_server, forKey: "version")
                        }else{
                            self.menu = Menus.getObjects(data: UserDefaults.standard.object(forKey: "menu") as! Data)
                        }
                    }else{
                        self.menu = Menus.getObjects(data: successaa)
                        UserDefaults.standard.setValue(successaa, forKey: "menu")
                        let menu_version_server =  Int(Menus.getVersion(data: successaa))!
                        UserDefaults.standard.setValue(menu_version_server, forKey: "version")
                    }
                    ImageDownloadCaching.getBlockImage(data: self.menu){ successa in
                        self.state_loading = false
                        self.loadingAnimated.isHidden = true
                        self.loadingAnimated.stopAnimating()
                        if let items = self.tabBarController?.tabBar.items {
                            items[1].isEnabled = true
                            self.pickupOutletButton.isEnabled = true
                            self.deliveryOutletButton.isEnabled = true
                            self.deliveryOutletButton.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0)
                            self.pickupOutletButton.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0)
                        }
                    }
                    
                }
            }
        }else {
            if (UserDefaults.standard.object(forKey: "menu") != nil){
                self.menu = Menus.getObjects(data: UserDefaults.standard.object(forKey: "menu") as! Data)
                self.state_loading = false
            }else{
                print("No red")
            }
        }
    }
    
}
