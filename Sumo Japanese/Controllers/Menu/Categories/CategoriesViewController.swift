//
//  MenuCatViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/15/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class CategoriesViewController: UIMenuViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list  = ["Arroz","Frijol"]
    var leftBarButtonItem : UIBarButtonItem!
    
    var menu: [Dictionary<String, Any>] = [[:]]
    var menubranch: [Dictionary<String, Any>] = [[:]]
    var stack: [Int] = []
    var backImg: UIImage = UIImage(named: "BagIcon")!
    var destinationView: String = ""
    
    @IBAction func goToCart(_ sender: Any) {
        self.destinationView = "cartView"
        performSegue(withIdentifier: "fromCategoriesToCart", sender: nil)
        
    }
    @IBOutlet weak var categoryTableView: UITableView!
    @IBOutlet weak var loadingAnimated: UIActivityIndicatorView!
    
    @IBOutlet weak var backCategory: UIBarButtonItem!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.menubranch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let file_name : String = self.menubranch[indexPath.row]["image_file"] as! String
        let server: String = Config.server as String + file_name
        let url =  URL(string: server )!
        let cell =  tableView.dequeueReusableCell(withIdentifier: "categoryViewCell") as? CategoryViewCell
       // let url =  URL(string: "http://app.foodthrones.com/Api/image/24-IMG_3461_930px.png")!
        ImageDownloadCaching.getImage(withURL: url)  { (catImage) in
            cell?.setLabel(text: (self.menubranch[indexPath.row]["name"] as! String))
            cell?.setImage(image: catImage!)
        }
        return (cell!)
    }
    
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print(indexPath.row)
        return indexPath
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.menubranch = (self.menubranch[indexPath.row]["rows"] as! NSArray) as! [Dictionary<String, Any>]
        if  self.menubranch[0]["type"] as! String == "FOOD" {
            self.destinationView = "foodView"
            performSegue(withIdentifier: "segueToFoodsCategory", sender: nil)
            
            
        }
        else{
            stack.append(indexPath.row)
            loadingAnimated.startAnimating()
            loadingAnimated.isHidden = false
            ImageDownloadCaching.getBlockImage(data: self.menubranch){ successa in
                self.loadingAnimated.isHidden = true
                self.loadingAnimated.stopAnimating()
                tableView.reloadData()
                self.navigationItem.leftBarButtonItem =  self.leftBarButtonItem
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    @objc func openCart (){}

    
    override func viewWillAppear(_ animated: Bool) {
        let cellNib = UINib(nibName: "CategoryViewCell", bundle: nil)
        categoryTableView.register(cellNib, forCellReuseIdentifier: "categoryViewCell")
        self.menu = Menus.getObjects(data: UserDefaults.standard.object(forKey: "menu") as! Data)
        self.menubranch = self.menu
        self.categoryTableView.reloadData()
        self.navigationItem.leftBarButtonItem = nil
        loadItemsNumBadge()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.leftBarButtonItem = UIBarButtonItem(title: "test", style:UIBarButtonItem.Style.plain,  target: self, action: #selector(myLeftSideBarButtonItemTapped))
        self.navigationItem.leftBarButtonItem = nil
        //self.menu = Menus.getObjects(data: UserDefaults.standard.object(forKey: "menu") as! Data)
        //self.menubranch = self.menu
        stack.append(0)
        
       // self.backCategory = UIBarButtonItem(title: "test", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(openCart))
      
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if self.destinationView == "foodView" {
            let destinationVC = segue.destination as! ItemsViewController
            destinationVC.menu = self.menubranch
            
        }
        
    }

    @objc func myLeftSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
    {
        if stack.count <= 2 {
            self.menubranch = self.menu
            stack.removeLast()
            self.categoryTableView.reloadData()
            self.navigationItem.leftBarButtonItem = nil
        }
    }
    
}
