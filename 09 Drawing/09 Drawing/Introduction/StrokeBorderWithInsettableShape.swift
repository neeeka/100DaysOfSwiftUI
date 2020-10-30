//
//  StrokeBorderWithInsettableShape.swift
//  09 Drawing
//
//  Created by Veronika Stefkova on 21/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct StrokeBorderWithInsettableShape: View {
    var body: some View {
        Circle()
            .strokeBorder(Color.blue, lineWidth: 40)
    }
}

struct StrokeBorderWithInsettableShape_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderWithInsettableShape()
    }
}
