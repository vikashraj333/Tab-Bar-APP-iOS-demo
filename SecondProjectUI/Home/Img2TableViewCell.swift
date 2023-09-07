//
//  Img2TableViewCell.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 16/07/22.
//

import UIKit

class Img2TableViewCell: UITableViewCell {

    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var textcell: UILabel!
    @IBOutlet weak var infobutton: UIButton!
    
    var handler: (() -> ())?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func updateUI(imageName: String) {
        infobutton.isHidden = false
        self.img1.image = UIImage(named: imageName)
        self.textcell.text = "Image \(imageName)"
    }
    
    @IBAction func infoButtonClicked(_ sender: Any) {
        handler?()
    }
    
}
