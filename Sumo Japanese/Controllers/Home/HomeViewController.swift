//
//  HomeViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/18/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

struct PromoStyle1 {
    var image = String()
    var title = String()
    var price = String()
    var item = String()
}

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menu: [Dictionary<String, Any>] = [[:]]
    var state_loading: Bool = true
    var promosHome = [PromoStyle1]()

    @IBOutlet weak var tableHome: UITableView!
    @IBOutlet weak var deliveryOutletButton: roundedButton!
    @IBOutlet weak var pickupOutletButton: roundedButton!
    
    @IBOutlet weak var loadingAnimated: UIActivityIndicatorView!
    
    @IBAction func deliveryActionBtn(_ sender: Any) {
        createAlert(title: "Welcome", message: "Do you want to log in or continue as a guest?")
    }
    @IBAction func pickupActionBtn(_ sender: Any) {
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
        promosHome = [
            PromoStyle1(image: "img_karens", title: "Karen's Pizza", price: "$3.00 Delivery", item: "10 - 20 min | Pizza"),
            PromoStyle1(image: "img_sumo", title: "Sumo Japanese Restaurant", price: "Free Delivery", item: "20 - 30 min | Japanese Food"),
            PromoStyle1(image: "img_subway", title: "Subway", price: "$1.00 Delivery", item: "56 - 60 min | Sandwish")
        ]
        
        let nibCell = UINib(nibName: "ImageAndTextTableViewCell", bundle: nil)
        tableHome.register(nibCell, forCellReuseIdentifier: "_imageAndTextTableViewCell")
    }
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Login", style: UIAlertAction.Style.default, handler: {(action) in
            self.performSegue(withIdentifier: "segueToLoginFromHome", sender: nil)
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Guest", style: UIAlertAction.Style.default, handler: {(action) in
            self.performSegue(withIdentifier: "segueToInitialSearchFromHome", sender: nil)
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promosHome.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "_imageAndTextTableViewCell") as? ImageAndTextTableViewCell
        cell?.setTitle(title: promosHome[indexPath.row].title)
        cell?.setImage(imageName: promosHome[indexPath.row].image)
        cell?.setTime(time: promosHome[indexPath.row].item)
        cell?.setPrice(price: promosHome[indexPath.row].price)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            performSegue(withIdentifier: "segueToCategoryFromHome", sender: nil)
        }
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
                            self.deliveryOutletButton.isEnabled = true
                            self.deliveryOutletButton.backgroundColor = UIColor(red:0.78, green:0.07, blue:0.00, alpha:1.0)
                            self.pickupOutletButton.isEnabled = true
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
