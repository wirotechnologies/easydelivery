//
//  FoodViewController.swift
//  Sumo Japanese
//
//  Created by Wilman Rojas on 12/16/18.
//  Copyright © 2018 Wiro Technologies. All rights reserved.
//

import UIKit

class FoodViewController: UIMenuViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    var favorite: Bool = false
    
    @IBOutlet var viewContainer: UIView!
    @IBOutlet weak var defineItemLabel: UITextField!
    
    @IBOutlet weak var optionsFoodTableView: UITableView!
    
    @IBOutlet weak var imageDish: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelCaloriesVal: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    @IBAction func favoriteButtonAction(_ sender: Any) {
        favorite = !favorite
        print(favorite)
        if favorite {
            favoriteButton.setImage(UIImage(named: "icon_favorite_full"), for: UIControl.State.normal)
        } else {
            favoriteButton.setImage(UIImage(named: "icon_favorite_unfull"), for: UIControl.State.normal)
        }
    }
    @IBAction func goToCartView(_ sender: Any) {
        performSegue(withIdentifier: "fromFoodViewToCartView", sender: nil)
    }
    @IBAction func addToCartBtn(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "CategoriesViewController") as! CategoriesViewController

        navigationController?.pushViewController(memberDetailsViewController, animated: true)
        //performSegue(withIdentifier: "backToCategoriesFromFoodView", sender: self)
    }

    @IBAction func AddAndCheckoutBtn(_ sender: Any) {
                performSegue(withIdentifier: "fromFoodViewToCartView", sender: nil)
    }
    
    var Moved: Bool = false
    var IntroFields: Bool = false
    var movedImage: Bool = false
    var optionSelected: Int = 0
    let ingredientsRpl = [
        [
            "payload":[
                ["beetOption1","beetOption2","beetOption3"]
            ],
            "title":"Do you want to add salad?",
            "description":"very popular adding",
            "item":"salad"
         ],
        [
            "payload":[
                ["substituteOption1","substituteOption2","substituteOption3"]
            ],
            "title":"Do you want to substitute letuce?",
            "description":"you can choose rize, tomato...",
            "item":"letuce"
        ],
        [
            "payload":[
                ["substituteOption1","substituteOption2","substituteOption3"]
            ],
            "title":"Do you want to substitute tomato?",
            "description":"we have other vegetables",
            "item":"tomato"
        ]
    ]

    
    
     var item: Dictionary<String, Any> = [:]

    @IBAction func addItemsCart(_ sender: UIButton) {
      
        let datase = UserDefaults.standard.value(forKey:"cart") as? Data
        var cart = Cart()
        cart = try! PropertyListDecoder().decode(Cart.self, from: datase!)
        cart.numItems = cart.numItems + 1
        UserDefaults.standard.setValue(try? PropertyListEncoder().encode(cart), forKey: "cart")
        loadItemsNumBadge()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "optionsViewCell") as? FoodViewCell
        //cell?.setTitle(text: (ingredientsRpl[indexPath.row]["title"] as! String))
        let index = indexPath.row
        switch index{
        case 0:
            cell?.setTitle(text: "Add ingredients")
        case 1:
            cell?.setTitle(text: "Remove ingredients")
        default:
            print("Default")
        }
        return (cell!)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        //performSegue(withIdentifier: "segueToAditionView", sender: nil)
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.optionSelected = indexPath.row
        if optionSelected == 0{
            performSegue(withIdentifier: "segueToAditionView", sender: nil)
        } else {
            performSegue(withIdentifier: "segueToRemoveIngredientsView", sender: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let cellNib = UINib(nibName: "FoodViewCell", bundle: nil)
        optionsFoodTableView.register(cellNib, forCellReuseIdentifier: "optionsViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItemsNumBadge()
        //print(self.item["description"])
        if item != nil{
            let file_name : String = self.item["image_file"] as! String
            let server: String = Config.server as String + file_name
            let url =  URL(string: server )!
            ImageDownloadCaching.getImage(withURL: url)  { (catImage) in
                self.imageDish.image = catImage
            }
            self.labelDescription.text = self.item["description"] as? String
            self.labelValue.text = self.item["value"] as? String
            self.labelCaloriesVal.text = ""
        }
        self.imageDish.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(moveImage)))
        //barButtonItem.addBadge(number: 10)
        // Do any additional setup after loading the view.
        let center: NotificationCenter = NotificationCenter.default;
        
        center.addObserver(self, selector:#selector(keyboardDidShow(notification:)),
                           name: UIResponder.keyboardWillShowNotification, object:nil)
        center.addObserver(self, selector:#selector(keyboardWillHide(notification:)),
                           name: UIResponder.keyboardWillHideNotification, object:nil)

    }
    
    @objc func moveImage(){
        UIView.animate(withDuration: 1,  delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 5, options: .curveEaseOut, animations: {
            if self.movedImage {
                
                self.imageDish.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.imageDish.frame.origin.y = 0
                self.movedImage = false
            }
            else{
                self.imageDish.frame.origin.y = (self.view.frame.size.height - 280) / 2
                self.imageDish.transform = CGAffineTransform(scaleX: 2, y: 2)
                self.movedImage = true
            }
        }, completion: nil)
        print("touch")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    weak var activeField: UITextField?
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    @objc func keyboardDidShow(notification:NSNotification) {
        if(activeField != nil){
            let heightOfView:CGFloat = self.view.frame.size.height
            let _:CGFloat = self.view.frame.maxY
            let info = notification.userInfo
            let rect:CGRect = info!["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            let rect2:CGFloat = (activeField?.frame.maxY)!
            if (rect2+((rect.maxY-heightOfView)/2) + 225 >= rect.maxY - rect.minY){
                viewContainer.transform = CGAffineTransform(translationX: 0, y: -1*(rect.size.height-85))
                self.Moved = true
            }
        }
    }
    @objc func keyboardWillHide(notification:NSNotification    ) {
        if(activeField != nil){
            if((Moved && !IntroFields) || ((activeField?.tag)! == 1) ){
                viewContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Moved = false
            }
            self.IntroFields = false
        }
    }
    private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String){
        let _:CGFloat = textField.frame.maxY
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        OperationQueue.main.addOperation {
            self.view.endEditing(true)
            let nextTag = textField.tag + 1
            if let nextResponder = textField.superview?.viewWithTag(nextTag) {
                nextResponder.becomeFirstResponder()
            }else{
                textField.resignFirstResponder()
                self.IntroFields = false
            }
        }
        self.IntroFields = true
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.hidesBottomBarWhenPushed = false

        
        //let destinationVC = segue.destination as! AdditionViewController
        //destinationVC.option = self.optionSelected
        
        //self.tabBarController?.tabBar.isHidden = false
        //self.tabBarController?.hidesBottomBarWhenPushed = false
    }

}
