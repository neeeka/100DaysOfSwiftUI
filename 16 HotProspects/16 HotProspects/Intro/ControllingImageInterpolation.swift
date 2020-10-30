//
//  ControllingImageInterpolation.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 18/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ControllingImageInterpolation: View {
    var body: some View {
        Image("example")
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ControllingImageInterpolation_Previews: PreviewProvider {
    static var previews: some View {
        ControllingImageInterpolation()
    }
}
