//
//  PaymentViewController.swift
//  Sumo Japanese
//
//  Created by imac on 8/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

    var Moved: Bool = false
    var IntroFields: Bool = false
    
    @IBOutlet weak var viewContainer: UIStackView!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var textFieldTip: UITextField!
    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var tablePayment: UITableView!
    @IBAction func tipSelectorAction(_ sender: Any) {
        let getIndex = tipSelector.selectedSegmentIndex
        switch getIndex {
        case 4:
            textFieldTip.isHidden = false
            labelTip.isHidden = true
        default:
            textFieldTip.isHidden = true
            labelTip.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "ButtonTableViewCell", bundle: nil)
        tablePayment.register(cellNib, forCellReuseIdentifier: "_buttonTableViewCell")
        
        let center: NotificationCenter = NotificationCenter.default;
        
        center.addObserver(self, selector:#selector(keyboardDidShow(notification:)),
                           name: UIResponder.keyboardWillShowNotification, object:nil)
        center.addObserver(self, selector:#selector(keyboardWillHide(notification:)),
                           name: UIResponder.keyboardWillHideNotification, object:nil)

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "_buttonTableViewCell") as? ButtonTableViewCell
        switch indexPath.row {
        case 0:
            cell?.setTextButton(title: "Add Gift Card")
            cell?.setImage(img: #imageLiteral(resourceName: "icon_gift_card"))
        case 1:
            cell?.setTextButton(title: "Add Credit Card")
             cell?.setImage(img: #imageLiteral(resourceName: "icon_credit_card"))
        case 2:
            cell?.setTextButton(title: "Pay at Restaurant")
             cell?.setImage(img: #imageLiteral(resourceName: "icon_bill"))
        default:
            return (cell!)
        }
        return (cell!)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "segueToGiftCard", sender: nil)
        case 1:
            performSegue(withIdentifier: "segueToAddCreditCard", sender: nil)
        case 2:
            print("segue to payAtRestaurantView")
        default:
            print("default case")
        }
    }
    //movimiento del teclado
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
            if (rect2+((rect.maxY-heightOfView)/2) >= rect.maxY - rect.minY){
                viewContainer.transform = CGAffineTransform(translationX: 0, y: -1*(rect.size.height-40))
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


}
