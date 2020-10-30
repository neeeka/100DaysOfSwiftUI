//
//  ContentView.swift
//  09 Drawing
//
//  Created by Veronika Stefkova on 21/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX - 10, y: rect.midY - 70))
        path.addLine(to: CGPoint(x: rect.midX - 10, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + 10, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + 10, y: rect.midY - 70))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                .inset(by: CGFloat(value))
                .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                    self.color(for: value, brightness: 1),
                    self.color(for: value, brightness: 0.5)
                ]), startPoint: .top, endPoint: . bottom), lineWidth: 2)
                
            }
        }
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

struct ContentView: View {
    @State private var arrowLineThickness: CGFloat = 5
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            Arrow()
                .stroke(Color.red, style: StrokeStyle(lineWidth: arrowLineThickness, lineCap: .round, lineJoin: .round))
                .frame(width: 100, height: 300)
            Spacer()
            Text("Line thickness")
                .padding(.horizontal)
            Slider(value: $arrowLineThickness, in: 1...20)
                .padding()
            ColorCyclingRectangle(amount: self.colorCycle)
                .frame(width: 200, height: 200)
            Slider(value: $colorCycle)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
