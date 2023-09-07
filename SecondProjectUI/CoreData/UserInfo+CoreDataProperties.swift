//
//  UserInfo+CoreDataProperties.swift
//  SecondProjectUI
//
//  Created by IOS Training 3 on 26/07/22.
//
//

import Foundation
import CoreData


extension UserInfo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserInfo> {
        return NSFetchRequest<UserInfo>(entityName: "UserInfo")
    }

    @NSManaged public var address: String?
    @NSManaged public var mail: String?
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var pincode: String?
    @NSManaged public var state: String?

}

extension UserInfo : Identifiable {

}
