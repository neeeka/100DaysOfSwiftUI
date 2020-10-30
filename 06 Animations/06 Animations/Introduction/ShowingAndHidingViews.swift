//
//  ShowingAndHidingViews.swift
//  06 Animations
//
//  Created by Veronika Stefkova on 13/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ShowingAndHidingViews: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ShowingAndHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingViews()
    }
}
