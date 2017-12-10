//
//  SnapchatHistoryTableViewCell.swift
//  Snapchat Clone
//
//  Created by Neha Kunjal on 10/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class SnapchatHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var sentImage: UIImageView!;
    @IBOutlet weak var snap: UILabel!
    var im: UIImage!
    var seen = -1
    @IBOutlet weak var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }

}
