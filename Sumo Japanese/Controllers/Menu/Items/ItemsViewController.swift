//
//  ItemsViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/16/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class ItemsViewController: UIMenuViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var menu: [Dictionary<String, Any>] = [[:]]
    var itemSelected: Int = 0
    var destinationView:  String = ""
    
    @IBAction func goToCart(_ sender: Any) {
        self.destinationView = "cartView"
        performSegue(withIdentifier: "fromItemsViewToCartView", sender: nil)
    }
    @IBOutlet weak var itemsCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItemsNumBadge()
        let width = (view.frame.size.width - 30) / 2
        let layout = itemsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: 160)
        //print(menu)
        //self.tabBarController
        // Do any additional setup after loading the view.
        
        //let rightBarButton = self.navigationItem.rightBarButtonItem as! UIBadgeBarButtonItem
        //rightBarButton.badgeNumber = 99
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let file_name : String = self.menu[indexPath.row]["image_file"] as! String
        let server: String = Config.server as String + file_name
        let url =  URL(string: server )!
        
        ImageDownloadCaching.getImage(withURL: url)  { (catImage) in
            if let view = cell.viewWithTag(1) as? UIImageView {
                view.image = catImage
                view.layer.borderWidth = 1.0
                view.layer.borderColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.0).cgColor
            }
        }
        
        if let label = cell.viewWithTag(2) as? UILabel {
            label.text = self.menu[indexPath.row]["name"] as? String
        }
        
        if let label = cell.viewWithTag(3) as? UILabel {
            label.text = "$\(String(describing: self.menu[indexPath.row]["value"]!))"
        }

        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        //let select = storyBoard.instantiateViewController(withIdentifier: "FoodVC") as! foodSelectViewController
        self.itemSelected = indexPath.row
        self.destinationView = "segueToItem"
        performSegue(withIdentifier: "segueToItem", sender: nil)
        
        
        // let food = self.menu[indexPath.row]
       // select.food = food
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if destinationView == "segueToItem" {
            let destinationVC = segue.destination as! FoodViewController
            destinationVC.item = self.menu[self.itemSelected]
            
        }
        print(self.menu[self.itemSelected])
        //self.hidesBottomBarWhenPushed = true
        //self.tabBarController?.tabBar.isHidden = true
        //self.tabBarController?.hidesBottomBarWhenPushed = true
    }

}
