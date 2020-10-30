//
//  NotificationWhenAppMovesToBackground.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 25/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct NotificationWhenAppMovesToBackground: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("Moving to the background!")
        }
    }
}

struct NotificationWhenAppMovesToBackground_Previews: PreviewProvider {
    static var previews: some View {
        NotificationWhenAppMovesToBackground()
    }
}
