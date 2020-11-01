//
//  ContentView.swift
//  07-09 Challenge - iHabit
//
//  Created by Veronika Stefkova on 26/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits = Habits()
    @State private var showingAddHabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.activities) { habit in
                    NavigationLink(destination: EditHabit(habit: habit, habits: self.habits)) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(habit.title)
                                    .font(.headline)
                                Text("Completed \(habit.completed)x")
                                    .font(.subheadline)
                                    
                            }
                            Text(habit.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            .italic()
                        }
                    }
                }
            .onDelete(perform: removeItems)
            }
        .navigationBarTitle("iHabits")
        .navigationBarItems(leading: EditButton(), trailing:
            Button(action: {
                self.showingAddHabit = true
            }) {
                Image(systemName: "plus")
            }
            )
                .sheet(isPresented: $showingAddHabit) {
                    AddHabit(habits: self.habits)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        habits.activities.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
