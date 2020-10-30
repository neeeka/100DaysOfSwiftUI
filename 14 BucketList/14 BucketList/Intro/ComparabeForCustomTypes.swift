//
//  ComparabeForCustomTypes.swift
//  14 BucketList
//
//  Created by Veronika Stefkova on 05/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func < (lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}


struct ComparabeForCustomTypes: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ].sorted()
    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

struct ComparabeForCustomTypes_Previews: PreviewProvider {
    static var previews: some View {
        ComparabeForCustomTypes()
    }
}
