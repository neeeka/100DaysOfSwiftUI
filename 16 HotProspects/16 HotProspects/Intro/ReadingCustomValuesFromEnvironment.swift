//
//  ReadingCustomValuesFromEnvironment.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 17/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    var body: some View {
        Text(user.name)
    }
}

struct ReadingCustomValuesFromEnvironment: View {
    let user = User()
    var body: some View {
        VStack {
            EditView()
            DisplayView()
        }.environmentObject(user)
    }
}

struct ReadingCustomValuesFromEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        ReadingCustomValuesFromEnvironment()
    }
}
