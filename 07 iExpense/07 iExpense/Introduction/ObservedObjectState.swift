//
//  ObservedObjectState.swift
//  07 iExpense
//
//  Created by Veronika Stefkova on 15/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ObservedObjectState: View {
    @ObservedObject private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName)")
            TextField("First name", text: $user.firstName)
            TextField("Last name", text: $user.lastName)
        }
    }
}

struct ObservedObjectState_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectState()
    }
}
