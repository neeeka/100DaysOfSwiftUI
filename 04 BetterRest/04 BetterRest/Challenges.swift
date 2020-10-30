//
//  Challenges.swift
//  04 BetterRest
//
//  Created by Veronika Stefkova on 08/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct Challenges: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
        
    var calculatedBedTime: String {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60
        var timeMessage: String
        do {
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            timeMessage = formatter.string(from: sleepTime)
        } catch {
            timeMessage = "Sorry, there was a problem calculating your bedtime"
        }
        return timeMessage
    }
        
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("When do you want to wake up?")) {
                        DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                    }
                    Section(header: Text("Desired amount of sleep") ) {
                        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                            Text("\(sleepAmount, specifier: "%g") hours")
                            }
                    .accessibility(value: Text(getAccessibleSleepAmount()))
                    }
                    
                    Section(header: Text("Number of Cups")) {
                        Picker("Daily Coffee Intake", selection: $coffeeAmount) {
                            ForEach(1..<21) {
                                if $0 == 1 {
                                    Text("\($0) cup")
                                } else {
                                    Text("\($0) cups")
                                }
                            }
                        }
                    }
                    Section(header: Text("Ideal Bedtime")) {
                        Text(calculatedBedTime)
                            .font(.title)
                    }
                }
                .navigationBarTitle("Better Rest")
           }
        }
    
    func getAccessibleSleepAmount() -> String {
        if Double(sleepAmount) == sleepAmount {
            return String(format: "%g", Double(sleepAmount)) + " hours"
        }
        let hours = Int(Double(sleepAmount))
        let minutesDecimal = sleepAmount - Double(sleepAmount)
        let minutes = Int(minutesDecimal * 60)
        return "\(hours) hours " + "\(minutes) minutes"
    }
        
        static var defaultWakeTime: Date {
            var components = DateComponents()
            components.hour = 7
            components.minute = 0
            return Calendar.current.date(from: components) ?? Date()
        }
    }

struct Challenges_Previews: PreviewProvider {
    static var previews: some View {
        Challenges()
    }
}
