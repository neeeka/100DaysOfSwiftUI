//
//  PulsingAnimation.swift
//  06 Animations
//
//  Created by Veronika Stefkova on 12/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct PulsingAnimation: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap me") {
            // self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke()
                .scaleEffect()
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
            )
        )
            .onAppear {
                self.animationAmount = 2
        }
    }
}

struct PulsingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulsingAnimation()
    }
}
