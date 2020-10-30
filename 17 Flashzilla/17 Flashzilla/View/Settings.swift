//
//  Settings.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 29/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI


struct Settings: View {
    @Binding var reviewUnknownCards: Bool
    @Environment(\.presentationMode) private var presentationMode
  
    
    var body: some View {
        NavigationView {
            VStack {
                Toggle(isOn: $reviewUnknownCards) {
                    Text("Automatically repeat unknown cards")
                }
                
                Spacer()
                Button("Dismiss") {
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
            .padding()
            .navigationBarTitle("Settings")
        }  
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(reviewUnknownCards: Binding.constant(false))
    }
}
