//
//  ViewsAsProperties.swift
//  03 ViewsAndModifiers
//
//  Created by Veronika Stefkova on 02/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ViewsAsProperties: View {
    var motto1: some View { Text("Draco dormiens") }
    let motto2 = Text("nunquam titillandus")
    
    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
