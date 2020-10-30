//
//  DetailView.swift
//  10-12 Challenge - ContactsWithCoreData
//
//  Created by Veronika Stefkova on 12/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var user: User
    var body: some View {
        List {
            Section(header: Text("Company")) {
                Text(user.wrappedCompany)
            }
            Section(header: Text("Email")) {
                Text(user.wrappedEmail)
            }
            Section(header: Text("Address")) {
                Text(user.wrappedAddress)
            }
            Section(header: Text("Friends")) {
                ForEach(user.friendArray, id: \.id) { friend in
                    NavigationLink(destination: DetailView(user: friend)) {
                        VStack(alignment: .leading) {
                            Text(friend.wrappedName)
                                .font(.headline)
                            Text(friend.wrappedEmail)
                                .font(.subheadline)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text("\(user.wrappedName), \(user.age)"), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var steve: User {
        let user = User()
        user.name = "Steve Jobs"
        user.age = 35
        user.email = "steve.jobs@apple.com"
        user.address = "Cupertino"
        
        return user
    }
    static var previews: some View {

        DetailView(user: steve)
    }
}
