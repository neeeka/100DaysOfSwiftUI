//
//  GameView.swift
//  04-06 Challenge - Edutainment
//
//  Created by Veronika Stefkova on 02/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct RectangleQuestion: View  {
    var text: String
    var color: Color
    var size: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(self.color)
                .frame(width: self.size, height: self.size)
                    
            Text(self.text)
                .font(.largeTitle)
            .bold()
                .padding()
                .foregroundColor(.white)
            }
            .padding()
    }
}


struct GameView: View {
    let multiplicator: Int
    let numberOfQuestion: Int
    
    @State private var questionCount = 1
    @State private var multiplicand = 0
    @State private var multiplier = 0
    @State private var result = 0
    @State private var answerArray = [0, 0, 0, 0]
    @State private var score = 0
    @State private var message = ""
    
    @State private var congratulationAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var wholeArray: [Int] {
        let biggestNumber = 12 * multiplicator
        var array = [Int]()
        for i in 1...biggestNumber {
            array.append(i)
        }
        return array.shuffled()
        
    }
   
    var body: some View {
        Section {
            Text("Score: \(score)/\(numberOfQuestion)")
             
                .foregroundColor(.green)
                .padding()
                .font(.headline)
                
            Text("Do you know the result?")
            .bold()
            .foregroundColor(.gray)
            .padding()
            .font(.title)
            HStack() {
                RectangleQuestion(text: "\(multiplicand)", color: .pink, size: 120)
                Text("x")
                    .bold()
                RectangleQuestion(text: "\(multiplier)", color: .pink, size: 120)
                
            }
            Spacer()
            
            Text("Choose your answer")
                .bold()
                .foregroundColor(.gray)
                .font(.title)
                
            
           VStack {
                HStack() {
                    RectangleQuestion(text: "\(answerArray[0])", color: .yellow, size: 100)
                        .onTapGesture {
                            self.checkAnswer(answer: self.answerArray[0])
                    }
                    RectangleQuestion(text: "\(answerArray[1])", color: .green, size: 100)
                        .onTapGesture {
                            self.checkAnswer(answer: self.answerArray[1])
                        }
                    
                }
                HStack {
                    RectangleQuestion(text: "\(answerArray[2])", color: .blue, size: 100)
                        .onTapGesture {
                            self.checkAnswer(answer: self.answerArray[2])
                        }
                    RectangleQuestion(text: "\(answerArray[3])", color: .orange, size: 100)
                        .onTapGesture {
                            self.checkAnswer(answer: self.answerArray[3])
                        }
               
                }
            }
        }
        .navigationBarTitle("Edutainment", displayMode: .inline)
        .alert(isPresented: $congratulationAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .cancel() {
                self.score = 0
            })
        }
        .onAppear {
            self.newQuestion()
        }
    }
    
    func checkAnswer(answer: Int) {
        if result == answer {
            score += 1
            message = " "
           
        } else {
            message = "\(multiplicand) x \(multiplier) = \(result)"
            
        }
        questionCount += 1
        newQuestion()
    }
    
    func newQuestion() {
        message = ""
        if questionCount <= numberOfQuestion {
            multiplicand = Int.random(in: 1...12)
            multiplier = Int.random(in: 1...multiplicator)
            result = multiplicand * multiplier
            
            for i in 1...3 {
                let a = Int.random(in: 1...12)
                let b = Int.random(in: 1...multiplicator)
                let c = a * b
                answerArray[i] = c
            }
            answerArray[0] = result
            answerArray.shuffle()
            print(answerArray)
        } else {
            congratulationAlert = true
            alertTitle = "🎉 Congratulation 🎉"
            alertMessage = "You correctly answered \(score) from \(numberOfQuestion) questions"
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(multiplicator: 2, numberOfQuestion: 20)
    }
}
