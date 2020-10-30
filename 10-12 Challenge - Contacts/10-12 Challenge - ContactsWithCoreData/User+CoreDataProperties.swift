//
//  User+CoreDataProperties.swift
//  10-12 Challenge - ContactsWithCoreData
//
//  Created by Veronika Stefkova on 12/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var friend: NSSet?
    
    public var wrappedAddress: String {
        address ?? "Unknown Address"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown Company"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown Email"
    }
    
    public var wrappedId: String {
        id ?? "Unknown ID"
    }
    
    public var wrappedName: String {
        name ?? "Unknown Name"
    }
    
    public var friendArray: [User] {
        let set = friend as? Set<User> ?? []
        
        return set.sorted { $0.wrappedName < $1.wrappedName }
    }
    

}

// MARK: Generated accessors for friend
extension User {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: User)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: User)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}
