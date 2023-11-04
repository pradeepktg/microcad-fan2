//
//  CustomMenuTableViewCell.swift
//  Smart Fan
//
//  Created by Pradeep Chandrasekaran on 09/08/19.
//  Copyright © 2019 Pradeep Chandrasekaran. All rights reserved.
//

import UIKit

class CustomMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lblMenuName: UILabel!
    @IBOutlet weak var menuIconImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
