//
//  DataViewCell.swift
//  FIT5140-Assignment2
//
//  Created by 沈宇帆 on 2018/9/16.
//  Copyright © 2018年 Monash University. All rights reserved.
//

import UIKit

class DataViewCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var pressLabel: UILabel!
    @IBOutlet weak var alti: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
