//
//  MyTableViewCell.swift
//  Snapchat Clone
//
//  Created by Neha Kunjal on 10/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
