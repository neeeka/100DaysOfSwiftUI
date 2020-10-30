//
//  Prospect.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 19/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var date = Date()
    fileprivate(set) var isContacted = false
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    static let saveKey = "SavedData"
    
    
    init() {
        let filename = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(Self.saveKey)
        if let data = try? Data(contentsOf: filename) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        self.people = []
        
   /* USER DEFAULTS:
         if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        self.people = []
 */   }
    
    private func save() {
   /*   USER DEFAULTS
         if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
   */
        do {
            let fileName = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(Self.saveKey)
            let data = try JSONEncoder().encode(self.people)
            try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data")
        }
        
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isContacted.toggle()
        save()
    }
    
    func sortedByName() -> [Prospect] {
        let sortedArray = people.sorted(by: {$0.name < $1.name})
        return sortedArray
    }
    func sortByDate() -> [Prospect] {
        let sortedArray = people.sorted(by: {$0.date < $1.date})
        return sortedArray
    }
}
