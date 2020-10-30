//
//  WorkingWithHierarchicalCodableData.swift
//  08 Moonshot
//
//  Created by Veronika Stefkova on 18/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct WorkingWithHierarchicalCodableData: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": "555, Taylor Swift Avenue",
                    "city": "Nashville"
                }
            }
            """
            struct User: Codable {
                var name: String
                var address: Address
            }
            
            struct Address: Codable {
                var street: String
                var city: String
            }
            
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
             
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
            
        }
    }
}

struct WorkingWithHierarchicalCodableData_Previews: PreviewProvider {
    static var previews: some View {
        WorkingWithHierarchicalCodableData()
    }
}
