//
//  ContentView.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 24/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI



enum ActiveSheet {
    case settingsScreen, editScreen
}

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    
    @State private var cards = [Card]()
    
    @State private var isActive = true
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    //Challenge 1
    @State private var initialCards = 0
    @State private var correctCards = 0
    @State private var incorrectCards = 0
    
    // Challenge 2
    @State private var reviewUnknownCards = false
    @State private var showingEditScreen = false
    @State private var showingSettingsScreen = false
    
    @State private var showSheet = false
    @State private var activeSheet: ActiveSheet = .editScreen
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                    )
                ZStack {
                    ForEach(cards) { card in
                        CardView(card: card, reviewUnknownCards: self.reviewUnknownCards) { isCorrect in
                            if isCorrect {
                                correctCards += 1
                            } else {
                                incorrectCards += 1
                                    if reviewUnknownCards {
                                        repeatCard(at: self.index(for: card))
                                        return
                                }
                            }
                            withAnimation {
                                self.removeCard(at: self.index(for: card))
                            }
                        }
                        .stacked(at: self.index(for: card), in: self.cards.count)
                        .allowsHitTesting(self.index(for: card) == self.cards.count - 1)
                        .accessibility(hidden: self.index(for: card) <  self.cards.count - 1)
                        
                    }
                
                    .allowsHitTesting(timeRemaining > 0)
                    if timeRemaining == 0 || !isActive {
                        SummaryView(reviewUnknownCards: reviewUnknownCards, initialCards: initialCards, correctCards: correctCards, incorrectCards: incorrectCards, restartClosure: resetCards)
                            .frame(width: 300, height: 200)
                    }
                }
            }
            VStack {
                HStack {
                    Button(action: {
                        self.showSheet = true
                        self.activeSheet = .settingsScreen
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Button(action: {
                        self.showSheet = true
                        self.activeSheet = .editScreen
                    }) {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            
            if differentiateWithoutColor || accessibilityEnabled {
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1)
                            }
                        }) {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Wrong"))
                        .accessibility(hint: Text("Mark your answer as being incorrect"))
                        
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1)
                            }
                        }) {
                            Image(systemName: "checkmark.circle")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                        }
                        .accessibility(label: Text("Correct"))
                        .accessibility(hint: Text("Mark your answer as being correct."))
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard self.isActive else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if self.cards.isEmpty == false {
                self.isActive = true
            }
            
        }
        .sheet(isPresented: $showSheet, onDismiss: resetCards) {
            if self.activeSheet == .settingsScreen {
                Settings(reviewUnknownCards: self.$reviewUnknownCards)
            } else {
                EditCards()
            }
            
        }
        .onAppear(perform: resetCards)
    }
    
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func repeatCard(at index: Int) {
        guard index >= 0 else { return }
        let card = cards[index]
        cards.remove(at: index)
        cards.insert(card, at: 0)
        
    }
    
    func resetCards() {
        loadData()
        timeRemaining = 100
        isActive = true
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
                initialCards = cards.count
                correctCards = 0
                incorrectCards = 0
            }
        }
        
    }
    
    func index(for card: Card) -> Int {
        return cards.firstIndex(where: { $0.id == card.id }) ?? 0
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
