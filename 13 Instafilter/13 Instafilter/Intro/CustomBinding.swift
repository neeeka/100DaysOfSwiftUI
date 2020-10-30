//
//  CustomBinding.swift
//  13 Instafilter
//
//  Created by Veronika Stefkova on 30/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct CustomBinding: View {
    @State private var blurAmout: CGFloat = 0
    
    var body: some View {
        let blur = Binding<CGFloat>(
            get: {
                self.blurAmout
            },
            set: {
                self.blurAmout = $0
                print("New value is \(self.blurAmout)")
            
            }
        )
        return VStack {
            Text("Hello, World!")
                .blur(radius: blurAmout)
            Slider(value: blur, in: 0...20)
        }
    }
}

struct CustomBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomBinding()
    }
}
