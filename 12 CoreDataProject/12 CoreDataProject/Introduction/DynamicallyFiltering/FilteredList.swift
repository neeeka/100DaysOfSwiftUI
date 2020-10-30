//
//  FilteredList.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 21/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreData


struct FilteredList<T: NSManagedObject, Content: View>: View {
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> {
        fetchRequest.wrappedValue
    }
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    // @ViewBuilder lets our containing view (whatever is using the list) send in multiple views, and our list will create an implicit HStack just like the regular List.
    
    // @escaping says the closure will be stored away and used later, which means Swift needs to take care of its memory.
    
    // %K, for “key” - will insert values we provide - "%@" will insert single quotes
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
}



struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
