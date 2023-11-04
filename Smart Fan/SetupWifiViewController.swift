//
//  SetupWifiViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 10/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class SetupWifiViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtSSID: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldBeautification(passingtextField: txtSSID)
        textFieldBeautification(passingtextField: txtPassword)
    }
    func textFieldBeautification(passingtextField: UITextField) {
        passingtextField.delegate = self
        passingtextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: passingtextField.frame.size.width))
        passingtextField.leftViewMode = .always
    }

    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func configureWifi(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
