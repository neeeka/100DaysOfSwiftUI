//
//  TwoSideBySideViews.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 04/08/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct TwoSideBySideViews: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New Secondary")) {
                 Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        .navigationBarTitle("Primary")
            Text("Secondary")
        }
       
    }
}

struct TwoSideBySideViews_Previews: PreviewProvider {
    static var previews: some View {
        TwoSideBySideViews()
    }
}
