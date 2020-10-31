//
//  SummaryView.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 15/10/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct SummaryView: View {
    let reviewUnknownCards: Bool
    let initialCards: Int
    let correctCards: Int
    let incorrectCards: Int
    let restartClosure: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color.black)
            
            VStack(alignment: .center) {
                Text("SUMMARY")
                    .font(.title)
                    .bold()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Cards in Total")
                        Text("Correct")
                        Text("Unknown")
                    }
                    VStack(alignment: .trailing) {
                        Text("\(initialCards)")
                        Text("\(correctCards)")
                        Text("\(incorrectCards)")
                    }
                }
                .font(.subheadline)
                .padding(.bottom)
                
                Button("Study again", action: restartClosure)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .clipShape(Capsule())
            }
            .foregroundColor(.white)
        }
    }
    
    
}


