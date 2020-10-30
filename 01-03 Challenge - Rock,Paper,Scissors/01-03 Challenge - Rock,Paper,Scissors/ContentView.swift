//
//  ContentView.swift
//  01-03 Challenge - Rock,Paper,Scissors
//
//  Created by Veronika Stefkova on 05/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let possibleMoves = ["Rock", "Paper", "Scissors"]
    let gameStates = ["WIN", "LOOSE"]
    
    
    
    @State private var currentChoice = Int.random(in: 0...2)
    @State private var gameState = Int.random(in: 0...1)

    @State private var userChoice = 0
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var score = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text(emojiShown(currentChoice))
                .font(.system(size: 40))
            VStack {
                HStack {
                    Spacer()
                    Text("Choose one to")
                    Spacer()
                }
                
                Text(gameStates[gameState])
                    .bold()
            }
            
            
            HStack {
                ForEach(0..<3) { number in
                    Button(action: {
                        self.buttonTapped(number)
                    }) {
                 
                        Text(self.emojiShown(number))
                            .font(.system(size: 40))
                        
                    }
                    .foregroundColor(.black)
                    
                }
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue"), action: {
                self.askQuestion()
            }))
        }
        
    }
    
    func buttonTapped(_ number: Int) {
        userChoice = number
        print("Button tapped, you chose \(possibleMoves[currentChoice]) you shold \(gameStates[gameState]) over \(possibleMoves[userChoice])")
        if gameStates[gameState] == "WIN" {
            if possibleMoves[currentChoice] == "Rock" && possibleMoves[userChoice] == "Paper" {
                    print("Possibility #1")
                    score += 1
                    alertTitle = "Congratulation"
                    alertMessage = "Your current score is \(score)"
                
            } else if possibleMoves[currentChoice] == "Paper" && possibleMoves[userChoice] == "Scissors" {
                    print("Possibility #2")
                    score += 1
                    alertTitle = "Congratulation"
                    alertMessage = "Your current score is \(score)"
                
            } else if possibleMoves[currentChoice] == "Scissors" && possibleMoves[userChoice] == "Rock" {
                    print("Possibility #3")
                    score += 1
                    alertTitle = "Congratulation"
                    alertMessage = "Your current score is \(score)"
            } else {
                print("Does the wrong answer work?")
                score -= 1
                alertTitle = "Wrong!"
                alertMessage = "Your current score is \(score)"
            }
        } else if gameStates[gameState] == "LOOSE" {
           if possibleMoves[currentChoice] == "Rock" && possibleMoves[userChoice] == "Scissors" {
                print("Possibility #4")
                   score += 1
                   alertTitle = "Congratulation"
                   alertMessage = "Your current score is \(score)"
               
           } else if possibleMoves[currentChoice] == "Paper" && possibleMoves[userChoice] == "Rock" {
                print("Possibility #5")
                   score += 1
                   alertTitle = "Congratulation"
                   alertMessage = "Your current score is \(score)"
               
           } else if possibleMoves[currentChoice] == "Scissors" && possibleMoves[userChoice] == "Paper" {
                print("Possibility #6")
                   score += 1
                   alertTitle = "Congratulation"
                   alertMessage = "Your current score is \(score)"
               
           } else {
            print("Does the wrong answer work?")
            score -= 1
            alertTitle = "Wrong!"
            alertMessage = "Your current score is \(score)"
            }
        }
        showingAlert = true
    }
    
    func askQuestion() {
        gameState = Int.random(in: 0...1)
        currentChoice = Int.random(in: 0...2)
        
    }
    
    func emojiShown(_ number: Int) -> String {
        let choice = possibleMoves[number]
        if choice == "Rock" {
            return "✊"
        } else if choice == "Paper" {
            return "🖐"
        } else {
            return "✌️"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
