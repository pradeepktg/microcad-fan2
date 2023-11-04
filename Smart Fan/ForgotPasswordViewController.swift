//
//  ForgotPasswordViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 07/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtUserId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldBeautification(passingtextField: txtUserId)

    }

    func textFieldBeautification(passingtextField: UITextField) {
       // passingtextField.layer.cornerRadius = 5
        passingtextField.delegate = self
        passingtextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: passingtextField.frame.size.width))
        passingtextField.leftViewMode = .always
    }
  
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)

    }
    
    
    

    
    @IBAction func closeForgotPassword(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
