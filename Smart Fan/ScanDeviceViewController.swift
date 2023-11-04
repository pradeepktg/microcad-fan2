//
//  ScanDeviceViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 09/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class ScanDeviceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ScanDeviceDelegate {
    
    

    @IBOutlet weak var deviceTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceTableView.delegate = self
        deviceTableView.dataSource = self
        deviceTableView.register(UINib(nibName: "ScanDeviceTableViewCell", bundle: nil), forCellReuseIdentifier: "deviceCell")
        deviceTableView.tableFooterView = UIView()
        deviceTableView.alwaysBounceVertical = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as! ScanDeviceTableViewCell
        
        cell.lblDeviceName.text = "Device \(indexPath.row + 1)"
        cell.delegate = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func checkDevice(deviceID: String) {
        
        print(deviceID)
        
        let deviceCheckerPopUp = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "deviceCheckerViewController") as! DeviceCheckerViewController
        self.addChild(deviceCheckerPopUp)
        deviceCheckerPopUp.view.frame = self.view.frame
        self.view.addSubview(deviceCheckerPopUp.view)
        deviceCheckerPopUp.didMove(toParent: self)
        
    }
    
    func connectDevice() {
        
        performSegue(withIdentifier: "setupWifiSeague", sender: self)
        
    }

    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
