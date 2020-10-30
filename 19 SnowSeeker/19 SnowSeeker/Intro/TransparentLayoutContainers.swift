//
//  TransparentLayoutContainers.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 04/08/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya and Toby")
        }
    }
}

struct TransparentLayoutContainers: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(content: UserView.init)
            } else {
                HStack(content: UserView.init)
            }
        }
        
    }
}

struct TransparentLayoutContainers_Previews: PreviewProvider {
    static var previews: some View {
        TransparentLayoutContainers()
    }
}
