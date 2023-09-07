//
//  ImageCollectionViewCell.swift
//  SecondProjectUI
//
//  Created by IOS Training 4 on 17/07/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
    var imageName: String?
    @IBOutlet weak var ImageView: UIImageView!
    
    static let identifier = "ImageCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ImageView.image = UIImage(named: imageName ?? "")
        // Initialization code
    }

    
    static func nib() -> UINib{
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }
}
