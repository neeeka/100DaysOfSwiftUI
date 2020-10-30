//
//  ManuallyPublishingObservableObjectChanges.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 18/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ManuallyPublishingObservableObjectChanges: View {
    @ObservedObject var updater = DelayedUpdater()
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct ManuallyPublishingObservableObjectChanges_Previews: PreviewProvider {
    static var previews: some View {
        ManuallyPublishingObservableObjectChanges()
    }
}
