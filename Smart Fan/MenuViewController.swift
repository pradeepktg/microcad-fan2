//
//  MenuViewController.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 30/07/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

enum MenuTypes: Int, CaseIterable {
    case Home
    case Sign
    case Add
    case Settings
    
    var menuDescription: String {
        switch self {
        case .Home:
            return "Home"
        case .Sign:
            return "Sign In/ Sign Out"
        case .Add:
            return "Add Devices"
        case .Settings:
            return "Settings"
       
        }
    }
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 

    var sampleText:String?
    @IBOutlet weak var menuTableView: UITableView!
    var didTapMenuType: ((MenuTypes) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        menuTableView.delegate = self
        menuTableView.dataSource = self
       // menuTableView.register(UINib(nibName: "MenuTableViewCell", bundle: nil), forCellReuseIdentifier: "menuCell")
        menuTableView.tableFooterView = UIView()
        menuTableView.showsVerticalScrollIndicator = false
        menuTableView.showsHorizontalScrollIndicator = false
        menuTableView.isScrollEnabled = false

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return MenuTypes.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! CustomMenuTableViewCell
        let menu = MenuTypes(rawValue: indexPath.row)
        cell.lblMenuName.text = menu?.menuDescription
        var setImageName = ""
        let imageName = menu?.menuDescription.lowercased()
        switch menu {
        case _ where imageName!.contains("home"):
            setImageName = "home"
        case _ where imageName!.contains("sign"):
            setImageName = "signin"
        case _ where imageName!.contains("add"):
            setImageName = "adddevices"
        case _ where imageName!.contains("settings"):
            setImageName = "settings"
        default:
            setImageName = "settings"
        }
        cell.menuIconImageView.image = UIImage(named: setImageName)
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedMenu = MenuTypes(rawValue: indexPath.row) else { return }
        dismiss(animated: true) { [weak self] in
            print(selectedMenu)
            self?.didTapMenuType?(selectedMenu)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let customSelectionView = UIView()
        customSelectionView.backgroundColor = UIColor(red: 160.0/255.0, green: 206.0/255.0, blue: 220.0/255.0, alpha: 1.0)
        cell.selectedBackgroundView = customSelectionView
    }


}
