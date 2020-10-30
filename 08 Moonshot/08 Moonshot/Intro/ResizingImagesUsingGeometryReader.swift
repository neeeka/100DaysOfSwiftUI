//
//  ResizingImagesUsingGeometryReader.swift
//  08 Moonshot
//
//  Created by Veronika Stefkova on 18/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ResizingImagesUsingGeometryReader: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("Example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct ResizingImagesUsingGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        ResizingImagesUsingGeometryReader()
    }
}
