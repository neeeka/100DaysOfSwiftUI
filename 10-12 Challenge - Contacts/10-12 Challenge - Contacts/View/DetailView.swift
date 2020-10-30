//
//  DetailView.swift
//  10-12 Challenge - Contacts
//
//  Created by Veronika Stefkova on 28/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var users: Users
    let user: User
    
    var body: some View {
            List {
                Section(header: Text("Company")) {
                    Text(user.company)
                }
                Section(header: Text("Email")) {
                    Text(user.email)
                }
                Section(header: Text("Address")) {
                    Text(user.address)
                }
                Section(header: Text("Friends")) {
                    ForEach(user.friends) { friend in
                        FriendView(users: self.users, friend: friend)
                    
                    }
                }
            }
            .navigationBarTitle(Text("\(user.name), \(user.age)"), displayMode: .inline)
    }
}

struct FriendView: View {
    @ObservedObject var users: Users
    var friend: Friend
    
    var body: some View {
        if let foundFriend = users.find(withId: friend.id) {
            return AnyView(AnotherFriendView(users: users, friend: foundFriend))
        } else {
            return AnyView(Text(friend.name))
        }
    }
}

struct AnotherFriendView: View {
    @ObservedObject var users: Users
    var friend: User
    
    var body: some View {
        NavigationLink(destination: DetailView(users: users, user: friend)) {
            VStack(alignment: .leading) {
                Text(friend.name)
                    .font(.headline)
                Text(friend.email)
                    .font(.subheadline)
            }
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static let steve = User(id: "123456", isActive: true, name: "Steve Jobs", age: 35, company: "Apple", email: "steve.jobs@apple.com", address: "Cupertino", friends: [])
    
    static var previews: some View {
        DetailView(users: Users(users: [steve]), user: steve)
    }
}

