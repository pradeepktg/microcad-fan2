//
//  DeviceCollectionViewCell.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 02/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

protocol DeviceCollectionViewCellDelegate {
    func didSelectDevice(deviceID: String)
}

class DeviceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var deviceIcon: UIImageView!
    @IBOutlet weak var lblRoomName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    var delegate: DeviceCollectionViewCellDelegate!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
         mainView.layer.cornerRadius = 5
        
    }

    @IBAction func openSettings(_ sender: UIButton) {
        delegate.didSelectDevice(deviceID: lblRoomName.text!)
    }
    
    
    }
