//
//  MetalRenderingWithDrawingGroup.swift
//  09 Drawing
//
//  Created by Veronika Stefkova on 21/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for: value, brightness: 1),
                        self.color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
     // Tells SwiftUI it should render the contents of the view into an off-screen image before putting it back onto the screen as a single rendered output => faster (part of Metal = Apple's framework for working directly with the GPU for extremely fast graphics) but DON'T USE IT THAT OFTEN
    .drawingGroup()
    
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct MetalRenderingWithDrawingGroup: View {
    @State private var colorCycle = 0.0
    var body: some View {
        VStack {
            ColorCyclingCircle(amount: self.colorCycle)
                .frame(width: 300, height: 300)
            Slider(value: $colorCycle)
                .padding()
        }
        
    }
}

struct MetalRenderingWithDrawingGroup_Previews: PreviewProvider {
    static var previews: some View {
        MetalRenderingWithDrawingGroup()
    }
}
