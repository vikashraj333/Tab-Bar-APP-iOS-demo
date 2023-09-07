//
//  SignUpTableViewController.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 26/07/22.
//

import UIKit

class SignUpTableViewController: UITableViewController {
    static var identifier = "SignUpTableViewController"
    var userData : [UserInfo] = []
    var isSql = true
  
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var mailLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var confirmPasswordLabel: UITextField!
    @IBOutlet weak var mobileLabel: UITextField!
    @IBOutlet weak var addressLabel: UITextField!
    @IBOutlet weak var stateLabel: UITextField!
    @IBOutlet weak var pincodeLabel: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
       
        guard let name = nameLabel.text else {return }
        guard let mail = mailLabel.text else {return }
        guard let password = passwordLabel.text else {return }
        guard let mobile =  mobileLabel.text else {return }
        guard let address = addressLabel.text else {return }
        guard let state = stateLabel.text else {return }
        guard let pincode = pincodeLabel.text else { return}
        
        let user = UserDetails.init(id: nil, name: name, address: address, mail: mail, mobile: mobile, password: password, pincode: pincode, state: state)
        if isSql{
            SqlDbManager.sharedInstance.insert(userDetails: user)
            print("SQL")
        }
        else{
        DatabaseHelperCoreData.sharedInstanceCD.saveUserInfoCD(userCD: user)
            print("CD")
        }
        
        func touchesBegan( touches: Set<UITouch>, with : UIEvent?){
            mobileLabel.resignFirstResponder()
            pincodeLabel.resignFirstResponder()
         }
        navigationController?.popViewController(animated: false)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.delegate = self
        mailLabel.delegate = self
        mobileLabel.delegate = self
        passwordLabel.delegate = self
        pincodeLabel.delegate = self
        stateLabel.delegate = self
        addressLabel.delegate = self

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func choiceSqlCoreData(_ sender: UISegmentedControl) {
       
        if sender.selectedSegmentIndex == 0{
            isSql = true
    }
        else{
            isSql = false
        }
 
}

}
extension SignUpTableViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin editing ")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}

