//
//  Habit.swift
//  07-09 Challenge - iHabit
//
//  Created by Veronika Stefkova on 27/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completed: Int
}

class Habits: ObservableObject {
    @Published var activities = [Activity]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    init() {
        if let activities = UserDefaults.standard.data(forKey: "Habits") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Activity].self, from: activities) {
                self.activities = decoded
                return
            }
        }
        self.activities = []
    }
    
}
