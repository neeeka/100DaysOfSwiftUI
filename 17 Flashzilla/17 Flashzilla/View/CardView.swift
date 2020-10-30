//
//  CardView.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 26/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    
    let card: Card
    
    
 
    
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @State private var feedback = UINotificationFeedbackGenerator()
    
    // Challenge 2
    let reviewUnknownCards: Bool
    var shouldRepeat: Bool {
        offset.width < 0 && reviewUnknownCards
    }
    var removal: ((_ isCorrect: Bool) -> Void)?
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(
                    differentiateWithoutColor ? Color.white : Color.white.opacity(1 - Double(abs(offset.width / 50)))
            )
            .background(
                differentiateWithoutColor ? nil : RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(setBackgroundColor(offset: offset))
            
            )
                .shadow(radius: 10)
            VStack {
                if accessibilityEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                    Text(card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    if isShowingAnswer {
                       Text(card.answer)
                        .font(.title)
                        .foregroundColor(.gray)
                        
                    }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5, y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibility(addTraits: .isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                    self.feedback.prepare()  
                }
                .onEnded { _ in
                    if abs(self.offset.width) > 100 {
                        if self.offset.width > 0 { // for real app try to avoid haptics, which happen to often, e.g.leave only error
                            self.feedback.notificationOccurred(.success)
                        } else {
                            self.feedback.notificationOccurred(.error)
                        }
                        self.removal?(self.offset.width > 0)
                        if self.shouldRepeat {
                            self.isShowingAnswer = false
                            self.offset = .zero
                        }
                    } else {
                        self.offset = .zero
                    }
                    
                }
        )
        .onTapGesture { self.isShowingAnswer.toggle() }
        .animation(.spring())
    }
    
    // Challenge 3 - set color
    func setBackgroundColor(offset: CGSize) -> Color {
        if offset.width > 0 {
            return .green
        }
        if offset.width < 0 {
            return .red
        }
        return .white
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example, reviewUnknownCards: false)
    }
}
