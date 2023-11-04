//
//  DeviceCheckerViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 09/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class DeviceCheckerViewController: UIViewController {

    @IBOutlet weak var dontShowButton: UIButton!
    @IBOutlet weak var gotitButton: UIButton!
    @IBOutlet weak var mainView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.layer.cornerRadius = 5
        gotitButton.layer.cornerRadius = 5
        dontShowButton.layer.cornerRadius = 5
        showAnimate()
    
    }

    func showAnimate() {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25) {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }
    
    func stopAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

    
    @IBAction func removePopUp(_ sender: UIButton) {
        stopAnimate()
    }
    

    @IBAction func dontShowAgain(_ sender: Any) {
        stopAnimate()
    }
}
