//
//  TableViewCellSetting.swift
//  SecondProjectUI
//
//  Created by IOS Training 1 on 18/07/22.
//

import UIKit

class TableViewCellSetting: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
