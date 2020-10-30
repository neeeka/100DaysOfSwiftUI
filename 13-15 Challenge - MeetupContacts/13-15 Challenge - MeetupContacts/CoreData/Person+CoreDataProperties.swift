//
//  Person+CoreDataProperties.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 27/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var image: UUID?
    @NSManaged public var name: NSObject?
    @NSManaged public var locationAvailable: Bool
    @NSManaged public var longitude: Double
    @NSManaged public var latitude: Double
    
    var wrappedName: String {
        name ?? "Unknown"
    }

}

extension Person : Identifiable {

}
