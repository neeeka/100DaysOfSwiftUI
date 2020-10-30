//
//  FramesAndCoordinates.swift
//  18 LayoutAndGeometry
//
//  Created by Veronika Stefkova on 30/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Buttom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}



struct FramesAndCoordinates: View {
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
        
        
    }
}

struct FramesAndCoordinates_Previews: PreviewProvider {
    static var previews: some View {
        FramesAndCoordinates()
    }
}
