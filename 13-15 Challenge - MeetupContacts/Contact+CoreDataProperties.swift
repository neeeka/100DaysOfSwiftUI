//
//  Contact+CoreDataProperties.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 27/10/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var imageID: UUID?
    @NSManaged public var latitude: Double
    @NSManaged public var locationAvailable: Bool
    @NSManaged public var longitude: Double
    @NSManaged public var name: String?
    
    var wrappedName: String {
        name ?? "Unknownn"
    }

}

extension Contact : Identifiable {

}
