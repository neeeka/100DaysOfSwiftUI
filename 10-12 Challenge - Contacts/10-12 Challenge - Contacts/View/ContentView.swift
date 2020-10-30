//
//  ContentView.swift
//  10-12 Challenge - Contacts
//
//  Created by Veronika Stefkova on 27/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var users = Users()
   
    var body: some View {
        NavigationView {
            List(users.all) { user in
                NavigationLink(destination: DetailView(users: self.users, user: user)) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.email)
                            .font(.subheadline)
                    }
                }
            }.navigationBarTitle("Contacts")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static let steve = User(id: "123456", isActive: true, name: "Steve Jobs", age: 35, company: "Apple", email: "steve.jobs@apple.com", address: "Cupertino", friends: [])
    
    static var previews: some View {
        DetailView(users: Users(users: [steve]), user: steve)
    }
}

