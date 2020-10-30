//
//  Favorites.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 05/08/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class Favorites: ObservableObject {
    // resorts that user has favorited
    private var resorts: Set<String>
    
    private let saveKey = "Favorites"
    
    init() {
        if let items = UserDefaults.standard.data(forKey: saveKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Set<String>.self, from: items) {
                resorts = decoded
                return
            }
            
        }
        self.resorts = []
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(resorts) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
}
