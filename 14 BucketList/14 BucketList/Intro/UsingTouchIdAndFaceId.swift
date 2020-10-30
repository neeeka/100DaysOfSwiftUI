//
//  UsingTouchIdAndFaceId.swift
//  14 BucketList
//
//  Created by Veronika Stefkova on 05/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import LocalAuthentication
import SwiftUI

struct UsingTouchIdAndFaceId: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }.onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct UsingTouchIdAndFaceId_Previews: PreviewProvider {
    static var previews: some View {
        UsingTouchIdAndFaceId()
    }
}
