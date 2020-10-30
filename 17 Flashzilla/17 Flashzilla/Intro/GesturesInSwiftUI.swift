//
//  GesturesInSwiftUI.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 24/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct DragGestureView: View {
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in self.offset = value.translation }
            .onEnded {_ in
                withAnimation {
                    self.offset = .zero
                    self.isDragging = false
                }
        }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    self.isDragging = true
                }
        }
        
        let combined = pressGesture.sequenced(before: dragGesture)
        return Circle()
            .fill(Color.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }

}
struct GesturesInSwiftUI: View {
    @State private var currentMagnificationAmount: CGFloat = 0
    @State private var finalMagnificationAmount: CGFloat = 1
    
    @State private var currentRotationAmount: Angle = .degrees(0)
    @State private var finalRotationAmount: Angle = .degrees(0)
    
    
    
    
    
    var body: some View {
        VStack {
            VStack {
                Text("Doble tapped gesture")
                    .onTapGesture(count: 2) {
                        print("Double tapped!")
                }
                Text("Long pressed gesture")
                    .onLongPressGesture(minimumDuration: 1, pressing: { inProgress in
                        print("In progress: \(inProgress)!")
                    }) {
                        print("Long pressed!")
                }
                Text("Scale Effect Gesture")
                    .scaleEffect(finalMagnificationAmount + currentMagnificationAmount)
                    .gesture(
                        MagnificationGesture()
                            .onChanged { amount in
                                self.currentMagnificationAmount = amount - 1
                                
                            }
                            .onEnded { amount in
                                self.finalMagnificationAmount += self.currentMagnificationAmount
                                self.currentMagnificationAmount = 0
                            }
                    )
                Text("Rotation Gesture")
                    .rotationEffect(finalRotationAmount + currentRotationAmount)
                    .gesture(
                        RotationGesture()
                            .onChanged { angle in
                                self.currentRotationAmount = angle
                                
                        }
                        .onEnded { angle in
                            self.finalRotationAmount += self.currentRotationAmount
                            self.currentRotationAmount = .degrees(0)
                            
                        }
                    )
            }.simultaneousGesture(
                TapGesture()
                    .onEnded { _ in
                        print("VStack tapped")
                    }
            )
            
        }
        
    }
}

struct GesturesInSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        GesturesInSwiftUI()
    }
}
