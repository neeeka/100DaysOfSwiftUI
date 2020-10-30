//
//  DisablingUserInteractivity.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 25/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct DisablingUserInteractivity: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        print("Rectangle tapped")
                }
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 300, height: 300)
                    .contentShape(Rectangle()) // or .allowHitTesting(false)
                    .onTapGesture {
                        print("Circle tapped!")
                }
            //    .allowsHitTesting(false)
            }
            
            VStack {
                Text("Hello")
                Spacer().frame(height: 100)
                Text("World")
            }.contentShape(Rectangle())
            .onTapGesture {
                print("VStack tapped!")
            }
        }
        
    }
}

struct DisablingUserInteractivity_Previews: PreviewProvider {
    static var previews: some View {
        DisablingUserInteractivity()
    }
}
