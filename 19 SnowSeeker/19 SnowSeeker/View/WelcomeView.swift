//
//  WelcomeView.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 05/08/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            Text("Please select a resort from the left-hand menu; swipe from the left edge to show it")
                .foregroundColor(.secondary)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
