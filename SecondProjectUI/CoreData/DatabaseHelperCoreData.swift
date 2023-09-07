//
//  DatabaseHelperCoreData.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 24/07/22.
//

import Foundation
import CoreData
import UIKit

public class DatabaseHelperCoreData {
    
    static let sharedInstanceCD = DatabaseHelperCoreData()
   
    public func getUser(mail : String?) -> UserInfo? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<UserInfo>.init(entityName: "UserInfo")
        fetchRequest.predicate = NSPredicate.init(format: "mail == %@", mail!)
        do {
            let result = try context.fetch(fetchRequest) as [UserInfo]
            return result.first
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
     func getAllData() -> Array<UserDetails>? {
        // var arrUser = [UserInfo]()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil}
        let context = appDelegate.persistentContainer.viewContext
//         let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserInfo")
        do {
            let  result = try context.fetch(UserInfo.fetchRequest())
            var userArray : [UserDetails] = []
            result.forEach(){userDetails in
                guard
                    let name = userDetails.name,
                    let mail = userDetails.mail,
                    let password = userDetails.password,
                    let address = userDetails.address,
                    let state = userDetails.state,
                    let mobile = userDetails.mobile,
                    let pincode = userDetails.pincode
                else {return }
                let user = UserDetails.init(id: nil, name: name, address: address, mail: mail, mobile: mobile, password: password, pincode: pincode, state: state)
//                let user = UserDetails.init(name: userDetails.name ?? "", address: userDetails.address ?? "", mail: userDetails.mail  ?? "", mobile: userDetails.mobile  ?? "", password: userDetails.password  ?? "", pincode: userDetails.pincode  ?? "", state: userDetails.state  ?? "")
                userArray.append(user)
            }
            return userArray
            
        } catch let error {
            print(error.localizedDescription)
        }
        
    return nil
    }
    
    func fetchOneUser(userMail : String?) -> UserDetails?   {
        let user1 = self.getUser(mail: userMail)
        guard let mail = user1?.mail, let name = user1?.name, let mobile = user1?.mobile, let password = user1?.password,let address = user1?.address, let pincode = user1?.pincode, let state = user1?.state else {return nil}
      
        let userDetails = UserDetails.init(id:nil, name: name, address: address, mail: mail, mobile: mobile, password: password, pincode: pincode, state: state)
       
        return userDetails
    }
    
    
    
        func updateData(user :  UserDetails) -> Bool {
            guard let mail = user.mail, let newName = user.name, let newMobile = user.mobile, let newAddress = user.address, let newPincode = user.pincode, let newPassword = user.password, let newState = user.state else { return false }
            guard let correspondingUser = self.getUser(mail: mail) else { return false }
            correspondingUser.name = newName; correspondingUser.password = newPassword; correspondingUser.mobile = newMobile; correspondingUser.address = newAddress; correspondingUser.pincode = newPincode; correspondingUser.state = newState
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
            appDelegate.saveContext()
            return true
        }

        func delete(user: UserDetails) -> Bool {
            guard let mail = user.mail else { return false }
            guard let correspondingUser = self.getUser(mail: mail) else { return false }
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
            let context = appDelegate.persistentContainer.viewContext
            context.delete(correspondingUser)
            do {
                try context.save()
            }catch {
                print("Deleted!")
            }
            return true

        }
    
    private init(){
        
    }
   
    
    // Save Data
    func saveUserInfoCD(userCD : UserDetails){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return}
        guard let name = userCD.name, let mail = userCD.mail , let password = userCD.password, let address = userCD.address, let state = userCD.state, let pincode = userCD.pincode, let mobile = userCD.mobile else {return}
        let userInfo = UserInfo.init(context: appDelegate.persistentContainer.viewContext)
        userInfo.name = name
        userInfo.mail = mail
        userInfo.password = password
        userInfo.mobile = mobile
        userInfo.address = address
        userInfo.state = state
        userInfo.pincode = pincode
        appDelegate.saveContext()
       
      
   }
    
    func isValid(mail : String, password:String) ->Bool?{
        let selected = self.fetchOneUser(userMail: mail)
        guard
            let mailcd = selected?.mail,
            let passwordcd = selected?.password
        else{
            return false
            
        }
        return (mailcd == mail && passwordcd == password)
    }
    
}

