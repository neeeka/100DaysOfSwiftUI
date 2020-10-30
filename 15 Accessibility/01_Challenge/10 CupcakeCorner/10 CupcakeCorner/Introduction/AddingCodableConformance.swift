//
//  AddingCodableConformance.swift
//  10 CupcakeCorner
//
//  Created by Veronika Stefkova on 03/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Paul Hudson"
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct AddingCodableConformance: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddingCodableConformance_Previews: PreviewProvider {
    static var previews: some View {
        AddingCodableConformance()
    }
}
