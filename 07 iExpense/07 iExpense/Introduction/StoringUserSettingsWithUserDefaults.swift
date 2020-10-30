//
//  StoringUserSettingsWithUserDefaults.swift
//  07 iExpense
//
//  Created by Veronika Stefkova on 16/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct StoringUserSettingsWithUserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct StoringUserSettingsWithUserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        StoringUserSettingsWithUserDefaults()
    }
}
