//
//  DynamicallyFilteringFetchRequest.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 21/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct DynamicallyFilteringFetchRequest: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"

    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }
        }
        
    }
}

struct DynamicallyFilteringFetchRequest_Previews: PreviewProvider {
    static var previews: some View {
        DynamicallyFilteringFetchRequest()
    }
}
