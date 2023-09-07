//
//  SignUpViewController.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 24/07/22.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var SignUpTableViewController: UITableView!
    static var identifier = "SignUpViewController"
    var userData : [UserInfo] = []
    
    //MARK: Outlets
    @IBOutlet var ScreenView: UIView!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var mailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UITextField!
    @IBOutlet weak var mobileLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var pincodeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func choiceSqlCoreData(_ sender: Any) {
    }
    
   

  
}

extension SignUpViewController{
    @IBAction func registerButton(_ sender: Any) {
        self.saveUserInfo()
    }
    
   
}

extension SignUpViewController{
    func saveUserInfo(){
        guard let name = nameLabel.text else {return }
        guard let mail = mailLabel.text else {return }
        guard let password = passwordLabel.text else {return }
        guard let mobile =  mobileLabel.text else {return }
        guard let address = addressLabel.text else {return }
        guard let state = stateLabel.text else {return }
        guard let pincode = pincodeLabel.text else { return}
        
        let user = UserDetails.init(name: name, address: address, mail: mail, mobile: mobile, password: password, pincode: pincode, state: state)
        DatabaseHelperCoreData.sharedInstanceCD.saveUserInfoCD(userCD: user)
        
        
    }
}
