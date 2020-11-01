//
//  ContentView.swift
//  01 Challenge - iConverter
//
//  Created by Veronika Stefkova on 29/04/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var chosenConversion = 0
    @State private var inputNumber = ""
    @State private var inputMetrics = 1
    @State private var outputMetrics = 1
    @State private var result = ""
    
    let conversionArray = ["🌡", "📐", "⏰", "🥛"]
    let temperatureArray = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengthArray = ["m", "km", "feet", "yards", "miles"]
    let timeArray = ["seconds", "minutes", "hours", "days"]
    let volumeArray = ["ml", "l", "cups", "pints", "gallons"]
    
    var inputArray: [String] {
        switch chosenConversion {
        case 0:
            return temperatureArray
        case 1:
            return lengthArray
        case 2:
            return timeArray
        default:
            return volumeArray
        }
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choose Conversion", selection: $chosenConversion) {
                        ForEach(0..<conversionArray.count) {
                            Text("\(self.conversionArray[$0])")
                        }
                    }
            
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("From")) {
                    TextField("Input", text: $inputNumber)
                    Picker("Input", selection: $inputMetrics) {
                        ForEach(0..<inputArray.count) {
                            Text("\(self.inputArray[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("To")) {
                    Picker("Output", selection: $outputMetrics) {
                        ForEach(0..<inputArray.count) {
                            Text("\(self.inputArray[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    Text(result)
                        .bold()
                }
            }
        .navigationBarTitle("iConverter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
