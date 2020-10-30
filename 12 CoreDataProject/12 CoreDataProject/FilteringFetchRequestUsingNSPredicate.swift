//
//  FilteringFetchRequestUsingNSPredicate.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 21/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreData

struct FilteringFetchRequestUsingNSPredicate: View {
    @Environment(\.managedObjectContext) var moc
    /* Examples of predicates:
     NSPredicate(format: "universe == %@", "Star Wars")
     NSPredicate(format: "name < %@", "F") -> return Defiant, Enterprise and Executor
     NSPredicate(format: "universe IN %@", ["Aliens","Firefly", "Star Trek"]) –> to check whether the universe is one of three options from an array
     NSPredicate(format: "name BEGINSWITH %@", "E") –> return all ships that start with a capital E
     NSPredicate(format: "name CONTAINS[c] %@", "e") -> return all ships that contains "e" or "E"
     NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e") –> return all ships that don't start with E
     
     */
     
    @FetchRequest(entity: Ship.entity(), sortDescriptors: [], predicate: NSPredicate(format: "universe == %@", "Star Wars")) var ships: FetchedResults<Ship>
    
    var body: some View {
        VStack {
            List(ships, id: \.self) { ship in
                Text(ship.name ?? "Unknown name")
            }
            Button("Add Examples") {
                let ship1 = Ship(context: self.moc)
                ship1.name = "Enterprise"
                ship1.universe = "Star Trek"
                
                let ship2 = Ship(context: self.moc)
                ship2.name = "Defiant"
                ship2.universe = "Star Trek"
                
                let ship3 = Ship(context: self.moc)
                ship3.name = "Millennium Falcon"
                ship3.universe = "Star Wars"
                
                let ship4 = Ship(context: self.moc)
                ship4.name = "Executor"
                ship4.universe = "Star Wars"
                
                try? self.moc.save()
            }
        }
    }
}

struct FilteringFetchRequestUsingNSPredicate_Previews: PreviewProvider {
    static var previews: some View {
        FilteringFetchRequestUsingNSPredicate()
    }
}
