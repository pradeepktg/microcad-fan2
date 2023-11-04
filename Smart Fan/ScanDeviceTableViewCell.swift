//
//  ScanDeviceTableViewCell.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 09/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

protocol ScanDeviceDelegate {
    func checkDevice(deviceID: String)
    func connectDevice()
}

class ScanDeviceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDeviceName: UILabel!
    @IBOutlet weak var mainView: UIView!
    var delegate: ScanDeviceDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func testDevice(_ sender: UIButton) {
        delegate.checkDevice(deviceID: lblDeviceName.text!)
    }
    @IBAction func gotoConnectDevice(_ sender: UIButton) {
        delegate.connectDevice()
    }
}
