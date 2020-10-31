//
//  FilteredListChallenge.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 26/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreData

enum Predicates: String {
    case beginsWith = "BEGINSWITH[c]"
    case contains =  "CONTAINS[c]"
}

struct FilteredListChallenge<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    init(predicate: Predicates, sortDescriptors: [NSSortDescriptor] = [], filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }
}

struct FilteringChallenge: View {
    @Environment(\.managedObjectContext) var moc
       @State var lastNameFilter = "A"
       private var sortedBy = [NSSortDescriptor(key: "lastName", ascending: true)]
       
       var body: some View {
           VStack {
            FilteredListChallenge(predicate: .contains, sortDescriptors: sortedBy, filterKey: "lastName", filterValue: lastNameFilter) { (singer: Singer) in
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



struct FilteredListChallenge_Previews: PreviewProvider {
    static var previews: some View {
       FilteringChallenge()
    }
}
