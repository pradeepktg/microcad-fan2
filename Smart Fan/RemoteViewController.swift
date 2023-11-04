//
//  RemoteViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 11/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class RemoteViewController: UIViewController {

    @IBOutlet weak var handleView: UIView!
    @IBOutlet weak var hoursView1: UIView!
    @IBOutlet weak var hoursView2: UIView!
    @IBOutlet weak var speedView: UIView!
    @IBOutlet weak var typeView: UIView!
    @IBOutlet weak var gestureImageView: UIImageView!
    @IBOutlet weak var lblFanName: UILabel!
    @IBOutlet weak var constraintHoursView1Top: NSLayoutConstraint!
    
    
    @IBOutlet weak var btnPower: UIButton!
    @IBOutlet weak var btn2H: UIButton!
    @IBOutlet weak var btn4H: UIButton!
    @IBOutlet weak var btn6H: UIButton!
    @IBOutlet weak var btn8H: UIButton!
    @IBOutlet weak var btnSpeed1: UIButton!
    @IBOutlet weak var btnSpeed2: UIButton!
    @IBOutlet weak var btnSpeed3: UIButton!
    @IBOutlet weak var btnSpeed4: UIButton!
    @IBOutlet weak var btnSpeed5: UIButton!
    @IBOutlet weak var btnSpeed6: UIButton!
    @IBOutlet weak var btnTurbo: UIButton!
    @IBOutlet weak var btnRev: UIButton!
    @IBOutlet weak var btnLed: UIButton!
    @IBOutlet weak var btnSmt: UIButton!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleView.layer.cornerRadius = 5
        hoursView1.layer.cornerRadius = 25
        hoursView2.layer.cornerRadius = 25
        typeView.layer.cornerRadius = 25
        speedView.layer.cornerRadius = 30
        
        roundedButton(passingView: hoursView1)
        roundedButton(passingView: hoursView2)
        roundedButton(passingView: speedView)
        roundedButton(passingView: typeView)
        
    }
    
    
    
    
    func roundedButton(passingView : UIView) {
        
        for view in passingView.subviews as [UIView] {
            
            if let button = view as? UIButton {
                button.layer.cornerRadius = button.frame.size.width / 2
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.darkGray.cgColor
               // button.layer.backgroundColor = UIColor.lightGray.cgColor
                button.layer.backgroundColor = UIColor.init(red: 68.0/255.0, green: 75.0/255.0, blue: 84.0/255.0, alpha: 0.3).cgColor
                
            }
        }
    }
    
    
//    func enableDisableButtons(passingView : UIView, value : Bool) {
//
//        for view in passingView.subviews as [UIView] {
//
//
//
//            if let button = view as? UIButton {
//
//                if(button == buttonLED) {
//                    button.isEnabled = true
//                }
//                else {
//
//                    button.isEnabled = value
//                }
//
//            }
//        }
//    }
    

    @IBAction func hours2H4HAction(_ sender: UIButton) {
        print("hours2H4HAction \(sender.tag)")
    }
    
    @IBAction func hours6H8HAction(_ sender: UIButton) {
         print("hours6H8HAction \(sender.tag)")
    }
    
    @IBAction func powerAction(_ sender: UIButton) {
        print("powerAction \(sender.tag)")
    }
    
    @IBAction func speedAction(_ sender: UIButton) {
         print("speedAction \(sender.tag)")
    }
    
    @IBAction func modeAction(_ sender: UIButton) {
        print("modeAction \(sender.tag)")
    }
    

}
