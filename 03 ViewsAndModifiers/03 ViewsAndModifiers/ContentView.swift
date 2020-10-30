//
//  ContentView.swift
//  03 ViewsAndModifiers
//
//  Created by Veronika Stefkova on 01/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct Font: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View {
    func largeFont() -> some View {
        self.modifier(Font())
    }
}
struct ContentView: View {
    var body: some View {
        Text("Custom Modifier")
        .largeFont()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
