//
//  TriggeringEventsWithTimer.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 25/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct TriggeringEventsWithTimer: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                self.counter += 1
        }
    }
}

struct TriggeringEventsWithTimer_Previews: PreviewProvider {
    static var previews: some View {
        TriggeringEventsWithTimer()
    }
}
