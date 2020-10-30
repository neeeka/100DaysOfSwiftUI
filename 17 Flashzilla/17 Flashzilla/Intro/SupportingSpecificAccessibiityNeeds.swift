//
//  SupportingSpecificAccessibiityNeeds.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 25/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct SupportingSpecificAccessibiityNeeds: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency

    @State private var scale: CGFloat = 1
    var body: some View {
        VStack {
            HStack {
                if differentiateWithoutColor {
                    Image(systemName: "checkmark.circle")
                }
                Text("Success")
            }
            .padding()
            .background(differentiateWithoutColor ? Color.black : Color.green)
            .foregroundColor(Color.white)
            .clipShape(Capsule())
            
            Text("Hello World!")
                .scaleEffect(scale)
                .onTapGesture {
                    withOptionalAnimation {
                        self.scale *= 1.5
                    }
            }
            
            Text("Hello Universe!")
                .padding()
                .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
                .foregroundColor(Color.white)
                .clipShape(Circle())
        }
        
    }
}

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct SupportingSpecificAccessibiityNeeds_Previews: PreviewProvider {
    static var previews: some View {
        SupportingSpecificAccessibiityNeeds()
    }
}
