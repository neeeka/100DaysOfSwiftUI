//
//  PushingNewViewsWithNavigationLink.swift
//  08 Moonshot
//
//  Created by Veronika Stefkova on 18/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct PushingNewViewsWithNavigationLink: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("Swift UI")
        }
    }
}

struct PushingNewViewsWithNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        PushingNewViewsWithNavigationLink()
    }
}
