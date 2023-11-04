//
//  LoginViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 07/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var unlockImageView: UIImageView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

       loginView.layer.cornerRadius = 5
        unlockImageView.layer.cornerRadius = unlockImageView.frame.size.width / 2
        txtUsername.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtUsername.frame.size.height))
        txtPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: txtPassword.frame.size.height))
        txtUsername.leftViewMode = .always
        txtPassword.leftViewMode = .always
        
    }

    @IBAction func closeLoginController(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    
    @IBAction func createAccount(_ sender: UIButton) {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        present(registerVC, animated: true, completion: nil)
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        let forgotVC = ForgotPasswordViewController()
        forgotVC.modalPresentationStyle = .fullScreen
        present(forgotVC, animated: true, completion: nil)
    }
    
    @IBAction func sign(_ sender: UIButton) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
