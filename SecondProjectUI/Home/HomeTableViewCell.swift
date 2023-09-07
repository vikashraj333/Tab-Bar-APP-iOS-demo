//
//  HomeTableViewCell.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 16/07/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var textcell: UILabel!
    @IBOutlet weak var textView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = .none
    }
    
}
