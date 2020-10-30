//
//  EditHabit.swift
//  07-09 Challenge - iHabit
//
//  Created by Veronika Stefkova on 29/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct EditHabit: View {
    var habit: Activity
    @State private var newTitle = ""
    @State private var newDescription = ""
    @State private var completionAmount = 0
    @ObservedObject var habits: Habits
    @State private var currentIndex = 0
    var body: some View {
        Form {
            TextField(habit.title, text: $newTitle)
            TextField(habit.description, text: $newDescription)
            Stepper(value: $completionAmount, in: 1...Int.max) {
                    
                     Text("Completed \(completionAmount)x")
                }
        }
        .onAppear(perform: {
            self.newTitle = self.habit.title
            self.newDescription = self.habit.description
            self.completionAmount = self.habit.completed
        })
        
        .onDisappear(perform: {
            if let index = self.habits.activities.firstIndex(of: self.habit) {
            self.currentIndex = index
                self.habits.activities[self.currentIndex] = Activity(title: self.newTitle, description: self.newDescription, completed: self.completionAmount)
            }
           
            
        })
        .navigationBarTitle(habit.title)
    }
}

struct EditHabit_Previews: PreviewProvider {
    
    static var previews: some View {
      
       EditHabit(habit: Habits().activities[0], habits: Habits())
    }
}
