//
//  BehindTheMainSwiftUIView.swift
//  03 ViewsAndModifiers
//
//  Created by Veronika Stefkova on 01/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct BehindTheMainSwiftUIView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct BehindTheMainSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BehindTheMainSwiftUIView()
    }
}
