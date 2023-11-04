//
//  GradientView.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 29/07/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit


@IBDesignable class GradientView: UIView {

    @IBInspectable var topColor:UIColor = UIColor(red: 87.0/255.0, green: 180.0/255.0, blue: 206.0/255.0, alpha: 1.0) {
        
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable var middleColor:UIColor = UIColor(red: 180.0/255.0, green: 222.0/255.0, blue: 231.0/255.0, alpha: 1.0) {
        
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable var bottomColor:UIColor = UIColor.white {
        
        didSet {
            setGradient()
        }
    }
    
    override class var layerClass : AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradient()
    }
    
    
    private func setGradient() {
        
        (layer as! CAGradientLayer).colors = [topColor.cgColor,middleColor.cgColor, bottomColor.cgColor]
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.5, y: 0)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.5, y: 1)
        
    }
    
   

}
