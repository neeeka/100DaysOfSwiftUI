//
//  CreatingTabsWithTabViewAndTableItem.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 17/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct CreatingTabsWithTabViewAndTableItem: View {
    @State private var selectedTab = 0
    
    // TabView should be the parent view, with the tabs inside it having a NavigationView
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Tab 1")
                .onTapGesture {
                    self.selectedTab = 1
                }
                .tabItem {
                    Image(systemName: "star")
                    Text("One")
                }
                .tag(0)
            
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
                .tag(1)
        }
    }
}

struct CreatingTabsWithTabViewAndTableItem_Previews: PreviewProvider {
    static var previews: some View {
        CreatingTabsWithTabViewAndTableItem()
    }
}
