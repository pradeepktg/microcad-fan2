//
//  RegisterViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 07/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textfieldView: UIView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtUserID: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtReenterPassword: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var constraintFirstNameTop: NSLayoutConstraint!
    
    var textFieldYOrigin: CGFloat!
    var textFieldHeight: CGFloat!
    var textFieldViewYOrigin: CGFloat!
    var presentTextFieldYOrigin: CGFloat!
    var presentKeyboardOrigin:CGFloat!
    var originDifference:CGFloat!
    var isKeyBoardPresent: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

       textFieldViewYOrigin = textfieldView.frame.origin.y

        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        textfieldView.layer.cornerRadius = 5
        textFieldBeautification(passingtextField: txtFirstName)
        textFieldBeautification(passingtextField: txtLastName)
        textFieldBeautification(passingtextField: txtUserID)
        textFieldBeautification(passingtextField: txtPassword)
        textFieldBeautification(passingtextField: txtReenterPassword)
        textFieldBeautification(passingtextField: txtMobile)
        textFieldBeautification(passingtextField: txtEmail)
    }

    func textFieldBeautification(passingtextField: UITextField) {
       // passingtextField.layer.cornerRadius = 5
        passingtextField.delegate = self
        passingtextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: passingtextField.frame.size.width))
        passingtextField.leftViewMode = .always
    }
    
    @objc func keyBoardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            print("Origin: \(textFieldYOrigin + textFieldViewYOrigin + textFieldHeight )" )
//            print(keyboardSize.origin.y)
//            print(keyboardSize.size.height)
            isKeyBoardPresent = true
             presentTextFieldYOrigin = textFieldYOrigin + textFieldViewYOrigin + textFieldHeight
             presentKeyboardOrigin = keyboardSize.origin.y
             originDifference = presentKeyboardOrigin - presentTextFieldYOrigin
            if originDifference < 0 {
                UIView.animate(withDuration: 1) {
                    self.constraintFirstNameTop.constant = self.constraintFirstNameTop.constant + self.originDifference
                    self.view.layoutIfNeeded()
                }
            }

        }
    }
    
    @objc func keyBoardWillHide(notification: NSNotification) {
        
       
        UIView.animate(withDuration: 1) {
            self.constraintFirstNameTop.constant = 16
            self.view.layoutIfNeeded()
        }
         isKeyBoardPresent = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
       
        UIView.animate(withDuration: 1) {
             self.constraintFirstNameTop.constant = 16
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textFieldYOrigin = textField.frame.origin.y
        textFieldHeight = textField.frame.size.height
        
        if isKeyBoardPresent {
            presentTextFieldYOrigin = textFieldYOrigin + textFieldViewYOrigin + textFieldHeight
             originDifference = presentKeyboardOrigin - presentTextFieldYOrigin
            
            if originDifference < 0 {
                UIView.animate(withDuration: 1) {
                   self.constraintFirstNameTop.constant = self.constraintFirstNameTop.constant + self.originDifference
                    self.view.layoutIfNeeded()
                }
                
            }
        }
        
    }
 
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?
        
        if nextResponder != nil {
            nextResponder?.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        
        return false
    }
    
    
    @IBAction func closeRegisteration(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

}
