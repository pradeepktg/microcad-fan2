//
//  AddDeviceViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 08/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class AddDeviceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHome(_ sender: UIButton) {
      self.navigationController?.popToRootViewController(animated: true)
    }
    
   

}
