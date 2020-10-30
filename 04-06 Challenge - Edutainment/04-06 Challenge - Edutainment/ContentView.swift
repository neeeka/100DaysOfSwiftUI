//
//  ContentView.swift
//  04-06 Challenge - Edutainment
//
//  Created by Veronika Stefkova on 01/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var multiplicator = 1
    @State private var questionArray = ["5", "10", "20", "All"]
    @State private var questionSelected = 1
    @State private var gameIsOn = false
    
    var numberOfQuestion: Int {
        if let number = Int(questionArray[questionSelected]) {
            return number
        }
            return multiplicator * 12
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to Edutainment app")
                    .font(.system(size: 40))
                Form {
                    Section(header: Text("Select multiplicator")) {
                        Stepper(multiplicator == 1 ? "\(multiplicator) table" : "\(multiplicator) tables" , value: $multiplicator, in: 1...12)
                            .padding()
                    }
                    Section(header: Text("How many questions?")) {
                        Picker("Number of questions", selection: $questionSelected) {
                            ForEach(0..<questionArray.count) {
                                Text("\(self.questionArray[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                NavigationLink(destination: GameView(multiplicator: multiplicator, numberOfQuestion: numberOfQuestion)) {
                    ZStack(alignment: .center) {
                        LinearGradient(gradient: Gradient(colors: [.gray, .black, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
                            .frame(width: 150, height: 60, alignment: .center)
                            .cornerRadius(10)
                        Text("Start")
                            .foregroundColor(.white)
                    
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
