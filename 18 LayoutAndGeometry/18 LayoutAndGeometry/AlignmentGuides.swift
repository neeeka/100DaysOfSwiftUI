//
//  AlignmentGuides.swift
//  18 LayoutAndGeometry
//
//  Created by Veronika Stefkova on 30/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct AlignmentGuides: View {
    var body: some View {
        VStack {
            
            HStack(alignment: .lastTextBaseline) {
                Text("Live")
                    .font(.caption)
                Text("Long")
                Text("and")
                    .font(.title)
                Text("prosper")
                    .font(.largeTitle)
            }
            VStack {
                VStack(alignment: .leading) {
                    Text("Hello, world!")
                        .alignmentGuide(.leading) { d in
                            d[.trailing]
                    }
                    Text("This is a longer line of text")
                }
                VStack(alignment: .leading) {
                  ForEach(0..<10) { position in
                      Text("Number \(position)")
                          .alignmentGuide(.leading) { _ in
                              CGFloat(position) * -10
                              
                      }
                      
                  }
                }
                
                
            }
            .background(Color.red)
            .frame(width: 400, height: 400)
            .background(Color.blue)
            
            
        }
        
    }
}

struct AlignmentGuides_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentGuides()
    }
}
