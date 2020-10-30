//
//  ArchivingWithCodable.swift
//  07 iExpense
//
//  Created by Veronika Stefkova on 16/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct NewUser: Codable {
    var firstName: String
    var lastName: String
}

struct ArchivingWithCodable: View {
    @State private var user = NewUser(firstName: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "UserData")
            }
        }
    }
}

struct ArchivingWithCodable_Previews: PreviewProvider {
    static var previews: some View {
        ArchivingWithCodable()
    }
}
