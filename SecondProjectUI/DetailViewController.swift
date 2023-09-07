//
//  DetailViewController.swift
//  AssignmentVikash
//
//  Created by IOS Training 3 on 16/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ImageCenter: UIImageView!
    
    var ImageName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ImageCenter.image = UIImage(named: ImageName)
        // Do any additional setup after loading the view.
    }
    

}
