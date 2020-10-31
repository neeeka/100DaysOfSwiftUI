//
//  SpecialEffectsLikeBlursBlending.swift
//  09 Drawing
//
//  Created by Veronika Stefkova on 22/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct SpecialEffectsLikeBlursBlending: View {
    @State private var amount: CGFloat = 0.0
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
                
            .frame(width: 300, height: 300)
            
            Image("PaulHudson")
                           .resizable().scaledToFit()
                           .frame(width: 100, height: 100)
                           .saturation(Double(amount))
                           .blur(radius: (1 - amount) * 200)
            Slider(value: $amount)
                .padding()
           
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct SpecialEffectsLikeBlursBlending_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffectsLikeBlursBlending()
    }
}
