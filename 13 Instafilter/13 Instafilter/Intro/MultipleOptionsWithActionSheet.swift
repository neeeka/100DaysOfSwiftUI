//
//  MultipleOptionsWithActionSheet.swift
//  13 Instafilter
//
//  Created by Veronika Stefkova on 30/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct MultipleOptionsWithActionSheet: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                .default(Text("Red")) {self.backgroundColor = .red},
                .default(Text("Green")) {self.backgroundColor = .green},
                .default(Text("Blue")) {self.backgroundColor = .blue},
                .cancel()
            ])
        }
    }
}

struct MultipleOptionsWithActionSheet_Previews: PreviewProvider {
    static var previews: some View {
        MultipleOptionsWithActionSheet()
    }
}
