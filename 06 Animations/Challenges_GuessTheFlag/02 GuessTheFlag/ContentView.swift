//
//  ContentView.swift
//  02 GuessTheFlag
//
//  Created by Veronika Stefkova on 30/04/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

// Challenge 3.2
struct FlagImage: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ShakeEffect: GeometryEffect {
 //   https://talk.objc.io/episodes/S01E173-building-a-shake-animation
    var position: CGFloat
    var animatableData: CGFloat {
        get {position}
        set {position = newValue}
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        print(position)
        // one cyclus = sin(x2pi)
        return ProjectionTransform(CGAffineTransform(translationX: -30 * sin(position * 4 * .pi), y: 0))
    }
    
    init(shakes: Int) {
        position = CGFloat(shakes)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0
    
    //Challenge 6.1
    @State private var spinAnimationAmounts = [0.0, 0.0, 0.0]
    @State private var animatingIncreaseScore = false
    
    //Challenge 6.2
    @State private var animatingOpacity = false
    @State private var wrongCountry = ""
    @State private var allowSubmitAnswer = true
    
    //Challenge 6.3
    @State private var shakeAnimationAmounts = [0, 0, 0]
    @State private var animatingDecreaseScore = false
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.purple, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                }
                ForEach(0..<3) { number in
                    FlagImage(name: self.countries[number])
                        .rotation3DEffect(.degrees(self.spinAnimationAmounts[number]), axis: (x: 0, y: 1, z: 0))
                        .modifier(ShakeEffect(shakes: self.shakeAnimationAmounts[number] * 2))
                        .opacity(self.animatingOpacity ? (number == self.correctAnswer ? 1 : 0.25) : 1)
                        .onTapGesture {
                            self.flagTapped(number)
                    }
                }
                
                Text("That was \(wrongCountry)")
                    .font(.headline)
                    .foregroundColor(animatingDecreaseScore ? .red : .clear)
                    .italic()
                
                HStack {
                    Spacer()
                    Text("Score")
                        .foregroundColor(.white)
                    ZStack {
                        Text("\(score)")
                            .foregroundColor(animatingIncreaseScore ? .green : (animatingDecreaseScore ? .red : .white))
                            .font(.title)
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(animatingIncreaseScore ? .green : .clear)
                            .opacity((animatingIncreaseScore ? 0 : 1))
                            .offset(x: -20, y: animatingIncreaseScore ? -50 : -20)
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(animatingDecreaseScore ? .red : .clear)
                            .opacity(animatingDecreaseScore ? 0 : 1)
                            .offset(x: -20, y: animatingDecreaseScore ? 50 : 20)
                    }
                    Spacer()
                }
                .offset(x: 0, y: 30)
                Spacer()
                
            }
        }
        
    }
    func flagTapped(_ number: Int) {
        guard allowSubmitAnswer else { return }
        allowSubmitAnswer = false
        
        let nextQuestionDelay = 1.5
        let flagAnimationDuration = 0.5
        let scoreUpdateDuration = 1.5
        
        withAnimation(.easeInOut(duration: flagAnimationDuration)) {
            self.animatingOpacity = true
        }
        
        
        if number == correctAnswer {
            score += 1
            withAnimation(.easeInOut(duration: flagAnimationDuration)) {
                self.spinAnimationAmounts[number] += 360
            }
            withAnimation(.linear(duration: scoreUpdateDuration)) {
                self.animatingIncreaseScore = true
            }
          
        } else {
            wrongCountry = countries[number]
            score -= 1
            withAnimation(.easeInOut(duration: flagAnimationDuration)) {
                self.shakeAnimationAmounts[number] = 2
            }
            withAnimation(.linear(duration: scoreUpdateDuration)) {
                self.animatingDecreaseScore = true
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + nextQuestionDelay) {
            self.askQuestion()
        }
    }
    
    func askQuestion() {
        spinAnimationAmounts = [0.0, 0.0, 0.0]
        animatingIncreaseScore = false
        animatingOpacity = false
        shakeAnimationAmounts = [0, 0, 0]
        animatingDecreaseScore = false
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        allowSubmitAnswer = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
