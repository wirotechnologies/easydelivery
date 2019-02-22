//
//  loginViewController.swift
//  Sumo Japanese
//
//  Created by imac on 6/02/19.
//  Copyright © 2019 Wiro Technologies. All rights reserved.
//

import UIKit

class LoginViewController: UIMenuViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: rounded_textField!
    @IBOutlet var viewContainer: UIView!
    
    var Moved: Bool = false
    var IntroFields: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController
        
        let center: NotificationCenter = NotificationCenter.default;
        
        center.addObserver(self, selector:#selector(keyboardDidShow(notification:)),
                           name: UIResponder.keyboardWillShowNotification, object:nil)
        center.addObserver(self, selector:#selector(keyboardWillHide(notification:)),
                           name: UIResponder.keyboardWillHideNotification, object:nil)

    }
    
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
            if((Moved && !IntroFields) || ((activeField?.tag)! == 2) ){
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
