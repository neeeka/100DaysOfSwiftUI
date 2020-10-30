//
//  AnyViewTypeErasure.swift
//  11 Bookworm
//
//  Created by Veronika Stefkova on 18/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct SizeClasses: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    var body: some View {
        if sizeClass == .compact {
            return AnyView(VStack {
                Text("Active size class:")
                Text("COMPACT")
            }
            .font(.largeTitle))
        } else {
            return AnyView(HStack {
                Text("Active size class")
                Text("REGULAR")
            }
            .font(.largeTitle))
        }
        
    }
}

struct SizeClasses_Previews: PreviewProvider {
    static var previews: some View {
        SizeClasses()
    }
}
