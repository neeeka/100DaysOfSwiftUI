//
//  ControllingTheAnimationStack.swift
//  06 Animations
//
//  Created by Veronika Stefkova on 13/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ControllingTheAnimationStack: View {
    
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ControllingTheAnimationStack_Previews: PreviewProvider {
    static var previews: some View {
        ControllingTheAnimationStack()
    }
}
