//
//  ScrollingDataWithScrollView.swift
//  08 Moonshot
//
//  Created by Veronika Stefkova on 18/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct CustomText: View {
    var text: String
    
    var body: some View {
        Text(text)
    }
    init(_ text: String) {
        print("Creating a CustomText")
        self.text = text
    }
}

struct ScrollingDataWithScrollView: View {
    var body: some View {
        
        // ScrollView - creates rows immediately, List - lazy
        
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct ScrollingDataWithScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollingDataWithScrollView()
    }
}
