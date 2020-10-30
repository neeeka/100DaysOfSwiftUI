//
//  CustomAlignmentGuide.swift
//  18 LayoutAndGeometry
//
//  Created by Veronika Stefkova on 30/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct CustomAlignmentGuide: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                Image("paul-hudson")
                .resizable()
                .frame(width: 64, height: 64)
            }
            VStack {
                Text("More text")
                Text("Example text")
                Text("Whatever")
                Text("It will still align")
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                    .font(.largeTitle)
            }
            
        }
    }
}

struct CustomAlignmentGuide_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlignmentGuide()
    }
}
