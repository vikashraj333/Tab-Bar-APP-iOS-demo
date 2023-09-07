//
//  Constants.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 28/07/22.
//

import Foundation

class Constants {
    static let dbPathConstant = "KelltonTraining.sqlite"
}
enum DefaultKeys : String {
    case mail
}
class LoginDefault {
    static func setData(mail:String){
        UserDefaults.standard.set(mail, forKey: DefaultKeys.mail.rawValue)
    }
}
