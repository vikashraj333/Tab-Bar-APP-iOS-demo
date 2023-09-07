//
//  SettingScreen.swift
//  SecondProjectUI
//
//  Created by IOS Training 1 on 18/07/22.
//

import UIKit

class SettingScreen: UIViewController {

    var delegate: SettingScreenDelegate?
    @IBOutlet weak var buttonView: UIButton!
    @IBOutlet weak var textFieldView: UITextField!
    @IBOutlet weak var labelView: UILabel!
    
    var callback: (()->())?
    
    var name: String?
    var imageName: String?
    var index = IndexPath()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelView.text = name
        textFieldView.delegate = self
        
        buttonView.titleLabel?.text = "Submit"
        textFieldView.backgroundColor = .placeholderText
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        labelView.text = textFieldView.text
        self.delegate?.dataPass(string: textFieldView.text!, index: index)
    }
}

extension SettingScreen: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty{
            buttonView.isEnabled = false
        }else{
            buttonView.isEnabled = true
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
