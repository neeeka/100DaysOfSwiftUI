//
//  ReadingTheValuesOfControls.swift
//  15 Accessibility
//
//  Created by Veronika Stefkova on 08/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ReadingTheValuesOfControls: View {
    @State private var estimate = 25.0
    @State private var rating = 3
    
    var body: some View {
        VStack {
          Slider(value: $estimate, in: 0...50)
            .padding()
             // voiceOver reads value of Slider as % - doesn't make sense
            .accessibility(value: Text("\(Int(estimate))"))
            
            Stepper("Rate our service \(rating)/5", value: $rating, in: 1...5)
            .accessibility(value: Text("\(rating) out of 5"))
        }
        
    }
}

struct ReadingTheValuesOfControls_Previews: PreviewProvider {
    static var previews: some View {
        ReadingTheValuesOfControls()
    }
}
