//
//  ContentView.swift
//  10-12 Challenge - ContactsWithCoreData
//
//  Created by Veronika Stefkova on 15/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var users: FetchedResults<User>
   
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink(destination: DetailView(user: user)) {
                        VStack(alignment: .leading) {
                            Text(user.wrappedName)
                                .font(.headline)
                            Text(user.wrappedEmail)
                                .font(.subheadline)
                        }
                    }
                }
            }
        .navigationBarTitle("Contacts")
            
            
        }
    .onAppear(perform: checkData)
    }
    func checkData() {
        if users.isEmpty {
            DataManager.loadData(moc: moc)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
