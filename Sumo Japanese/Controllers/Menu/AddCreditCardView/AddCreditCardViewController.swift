//
//  PaymentViewController.swift
//  Sumo Japanese
//
//  Created by imac on 5/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class AddCreditCardViewController: UIMenuViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    

    @IBOutlet weak var viewContainer: UIView!
    
    
    @IBOutlet weak var nameOnCard: UITextField!
    @IBOutlet weak var CreditCardNumber: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var year: UITextField!
    @IBOutlet weak var cvv: UITextField!
    @IBOutlet weak var address_1: UITextField!
    @IBOutlet weak var address_2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBAction func addCardButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var statePicker = UIPickerView()
    var countryPicker = UIPickerView()
    var stateData = ["DC", "MM", "FL", "GU", "CH"]
    var countryData = ["Miami", "New York", "Angeles", "Silicon Valley"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.delegate = self
        statePicker.dataSource = self
        state.inputView = statePicker
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
        country.inputView = countryPicker
        
        let center: NotificationCenter = NotificationCenter.default;
        
        center.addObserver(self, selector:#selector(keyboardDidShow(notification:)),
                           name: UIResponder.keyboardWillShowNotification, object:nil)
        center.addObserver(self, selector:#selector(keyboardWillHide(notification:)),
                           name: UIResponder.keyboardWillHideNotification, object:nil)
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated:false)
        month.inputAccessoryView = toolBar
        year.inputAccessoryView = toolBar
        cvv.inputAccessoryView = toolBar
        country.inputAccessoryView = toolBar
        state.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
    var Moved: Bool = false
    var IntroFields: Bool = false
    
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
            if (rect2+((rect.maxY-heightOfView)/2) + 125 >= rect.maxY - rect.minY){
                viewContainer.transform = CGAffineTransform(translationX: 0, y: -1*(rect.size.height-80))
                self.Moved = true
            }
        }
    }
    @objc func keyboardWillHide(notification:NSNotification    ) {
        if(activeField != nil){
            if((Moved && !IntroFields) || ((activeField?.tag)! == 10) ){
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

    
    //INICIO DEL PICKERVIEW
    @available(iOS 2.0, *)
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == statePicker {
            return stateData.count
        } else {
            return countryData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == statePicker {
            state.text = stateData[row]
        } else {
            country.text = countryData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == statePicker {
            return stateData[row]
        } else {
            return countryData[row]
        }
        
    }
    //FIN DEL PICKERVIEW
}
