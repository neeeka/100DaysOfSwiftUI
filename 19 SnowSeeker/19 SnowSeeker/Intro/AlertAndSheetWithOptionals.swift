//
//  AlertAndSheetWithOptionals.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 04/08/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertAndSheetWithOptionals: View {
    @State private var selectedUser: User? = nil
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                self.selectedUser = User()
        }
        .alert(item: $selectedUser) { user in
            Alert(title: Text(user.id))
        }
    }
}

struct AlertAndSheetWithOptionals_Previews: PreviewProvider {
    static var previews: some View {
        AlertAndSheetWithOptionals()
    }
}
