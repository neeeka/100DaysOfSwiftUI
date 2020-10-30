//
//  ScrollViewEffects.swift
//  18 LayoutAndGeometry
//
//  Created by Veronika Stefkova on 30/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ScrollViewEffects: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(width: fullView.size.width)
                            .background(self.colors[index % 7])
                            .rotation3DEffect(.degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct SecondView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Rectangle()
                            .fill(self.colors[index % 7])
                        .frame(height: 150)
                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(width: 50)
                }
            }
            .padding(.horizontal, (fullView.size.width - 150) / 2)
        }
    }
    .edgesIgnoringSafeArea(.all)
    }
}

struct ScrollViewEffects_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewEffects()
    }
}
