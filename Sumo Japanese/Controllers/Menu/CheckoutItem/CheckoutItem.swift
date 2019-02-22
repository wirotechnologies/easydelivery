//
//  CheckoutItem.swift
//  Sumo Japanese
//
//  Created by imac on 31/01/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit
import Foundation

struct itemProps {
    var itemName = String()
    var itemValue = String()
}

struct itemDetail {
    var title = String()
    var sectionData = [itemProps]()
}

class CheckoutItem: UIMenuViewController, UITableViewDelegate, UITableViewDataSource, DetailCellDelegate, UITextFieldDelegate {
    
    func didTapWatchNow(goTo: String) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        switch goTo {
        case "Added Ingredients":
            let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "AditionViewController") as! AdditionViewController
            navigationController?.pushViewController(memberDetailsViewController, animated: true)
        case "Removed Ingredients":
            let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "RemoveViewController") as! RemoveIngredientsViewController
            navigationController?.pushViewController(memberDetailsViewController, animated: true)
        default: break
        }
    }
    
    var itemData = [itemDetail]()
    //BANDERAS PARA EFECTUAR EL MOVIMIENTO DE LA VISTA AL HACER FOCUS EN EL INPUT
    var Moved: Bool = false
    var IntroFields: Bool = false

    @IBOutlet weak var heightScrollContent: NSLayoutConstraint!
    @IBOutlet weak var tableCheckout: UITableView!
    @IBOutlet var viewContainer: UIView!
    @IBOutlet weak var changeItemLabel: UITextField!
    @IBAction func checkoutButton(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main", bundle:nil)
        let memberDetailsViewController = storyBoard.instantiateViewController(withIdentifier: "CheckoutViewController") as! CheckoutViewController
         navigationController?.pushViewController(memberDetailsViewController, animated: true)
        //performSegue(withIdentifier: "segueToCheckoutView", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController
        
        itemData = [
            itemDetail(title: "Added Ingredients", sectionData:[
                itemProps(itemName: "Tomato", itemValue: "$5"),
                itemProps(itemName: "Potato", itemValue: "$5"),
                itemProps(itemName: "Rize", itemValue: "$5")
                ]),
            itemDetail(title: "Removed Ingredients", sectionData:[
                itemProps(itemName: "Salad", itemValue: "$0"),
                itemProps(itemName: "Pork", itemValue: "$0")
                ])
        ]
        
        let cellNibTitle = UINib(nibName: "TitleTableViewCell", bundle: nil)
        tableCheckout.register(cellNibTitle, forCellReuseIdentifier: "titleTableViewCell_")
        let cellNibContent = UINib(nibName: "ContentTableViewCell", bundle: nil)
        tableCheckout.register(cellNibContent, forCellReuseIdentifier: "contentTableViewCell_")
        
        heightScrollContent.constant += CGFloat(50 * itemData.count)
        heightScrollContent.constant += CGFloat(35 * itemData[0].sectionData.count)
        heightScrollContent.constant += CGFloat(35 * itemData[1].sectionData.count)
        
        //ACTIVANDO LAS NOTIFICACIONES DEL TECLADO
        let center: NotificationCenter = NotificationCenter.default;
        center.addObserver(self, selector:#selector(keyboardDidShow(notification:)),
                           name: UIResponder.keyboardWillShowNotification, object:nil)
        center.addObserver(self, selector:#selector(keyboardWillHide(notification:)),
                           name: UIResponder.keyboardWillHideNotification, object:nil)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemData[section].sectionData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "titleTableViewCell_") as? TitleTableViewCell
        let cellContent = tableView.dequeueReusableCell(withIdentifier: "contentTableViewCell_") as? ContentTableViewCell
        
        cell?.delegate = self
        
        if indexPath.row != 0 {
            cellContent?.setName(text: itemData[indexPath.section].sectionData[indexPath.row - 1].itemName)
            cellContent?.setPrice(text: itemData[indexPath.section].sectionData[indexPath.row - 1].itemValue)
          return (cellContent!)
        } else {
            cell?.setTitle(text: itemData[indexPath.section].title)
            return (cell!)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
       if indexPath.row != 0 {
            return 35
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(cell.bounds.height)
    }
    //INICIO DE FUNCIONES DE TECLADO PARA MOVER LA VISTA
    
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
                viewContainer.transform = CGAffineTransform(translationX: 0, y: -1*(rect.size.height-140))
                self.Moved = true
            }
        }
    }
    @objc func keyboardWillHide(notification:NSNotification    ) {
        if(activeField != nil){
            if((Moved && !IntroFields) || ((activeField?.tag)! == 0) ){
                viewContainer.transform = CGAffineTransform(translationX: 0, y: 0)
                self.Moved = false
            }
            self.IntroFields = false
        }
    }
    private func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String){
        let _:CGFloat = textField.frame.maxY
    }
    
    //FIN DE FUNCIONES DE TECLADO PARA MOVER LA VISTA
    //INICIO DE OCULTAR TECLADO AL DAR ENTER
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
    //FIN DE OCULTAR TECLADO AL DAR ENTER
}
