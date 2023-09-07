//
//  UseriInfo.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 26/07/22.
//


import Foundation


// Local Data Model
class UserDetails {
    var id : Int?
    var name: String?
    var address: String?
    var mail: String?
    var mobile: String?
    var password: String?
    var pincode: String?
   var state: String?

    
    init(id: Int? ,name: String, address: String, mail : String, mobile : String, password : String, pincode: String , state:String){
        self.id = id
        self.name = name
        self.mail = mail
        self.password = password
        self.mobile = mobile
        self.address = address
        self.pincode = pincode
        self.state = state
       
    }
    
}
