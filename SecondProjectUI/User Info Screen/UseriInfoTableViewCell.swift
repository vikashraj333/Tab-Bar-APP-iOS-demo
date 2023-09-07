//
//  UseriInfoTableViewCell.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 27/07/22.
//

import UIKit

class UseriInfoTableViewCell: UITableViewCell {
    
    static let identifier = "UseriInfoTableViewCell"
    @IBOutlet weak var lablmail: UILabel!
    @IBOutlet weak var lablMobile: UILabel!
    @IBOutlet weak var lablAddress: UILabel!
    @IBOutlet weak var lablName: UILabel!
    @IBOutlet weak var lablState: UILabel!
    @IBOutlet weak var lablPassword: UILabel!
    
    
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func didSetValue(name : String, mail: String, mobile:String, address : String, state : String){
        lablName.text = name
        lablmail.text = mail
        lablMobile.text = mobile
        lablAddress.text = address
        lablState.text = state
    }
}
