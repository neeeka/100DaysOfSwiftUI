//
//  AddHabit.swift
//  07-09 Challenge - iHabit
//
//  Created by Veronika Stefkova on 28/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct AddHabit: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var habits: Habits
    @State private var title = ""
    @State private var description = ""
    
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("New Habit")
            .navigationBarItems(trailing: Button("Save") {
                let habit = Activity(title: self.title, description: self.description, completed: 0)
                self.habits.activities.append(habit)
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(habits: Habits())
    }
}
