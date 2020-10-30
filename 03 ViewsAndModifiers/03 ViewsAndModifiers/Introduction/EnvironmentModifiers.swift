//
//  EnvironmentModifiers.swift
//  03 ViewsAndModifiers
//
//  Created by Veronika Stefkova on 02/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
                .font(.largeTitle)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
