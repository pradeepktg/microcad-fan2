//
//  MenuTableViewCell.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 30/07/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {


    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var lblMenuName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
