//
//  ConditionalModifiers.swift
//  03 ViewsAndModifiers
//
//  Created by Veronika Stefkova on 02/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello World") {
            self.useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}
