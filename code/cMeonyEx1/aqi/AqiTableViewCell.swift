//
//  AqiTableViewCell.swift
//  aqi
//
//  Created by Jack on 2018/12/4.
//  Copyright © 2018年 Jack. All rights reserved.
//

import UIKit

class AqiTableViewCell: UITableViewCell {

    @IBOutlet weak var aqiCellView: UIView!

    @IBOutlet weak var quantiy: UILabel!
    @IBOutlet weak var productKey: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        aqiCellView.layer.cornerRadius = 5
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
