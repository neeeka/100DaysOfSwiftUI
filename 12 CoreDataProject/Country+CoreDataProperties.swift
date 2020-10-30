//
//  Country+CoreDataProperties.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 22/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }
    
    
    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
    
    public var wrappedShortName: String {
        shortName ?? "Unknown Country"
    }
    
    public var wrappedFullName: String {
        fullName ?? "Unknown Country"
    }
    
    /* NSSet - Objective-C data type - equivalent to Swift’s Set - can’t be used with SwiftUI’s ForEach.
        1. Convert it from an NSSet to a Set<Candy> – a Swift-native type where we know the types of its contents.
        2. Convert that Set<Candy> into an array, so that ForEach can read individual values from there.
        3. Sort that array, so the candy bars come in a sensible order => sorting a set automatically returns an array
    */
    
    public var candyArray: [Candy] {
        let set = candy as? Set<Candy> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}
