//
//  Contact.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 24/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation
import SwiftUI

struct Contact: Comparable, Codable, Identifiable, Equatable {
    var id = UUID()
    var name: String
    var email: String?
    var image: Data?
    
    static func < (lhs: Contact, rhs: Contact) -> Bool {
        lhs.name < rhs.name
    }
    
    
}

class Contacts: ObservableObject {
    @Published var people = [Contact]() {
        didSet {
            let fileName = getDocumentDirectory().appendingPathComponent("SavedContacts")
            do {
                let data = try JSONEncoder().encode(people)
                try data.write(to: fileName, options: [.atomicWrite, .completeFileProtection])
            } catch {
                print("Unable to save data")
            }
        }
        
    }
    init() {
        let fileName = getDocumentDirectory().appendingPathComponent("SavedContacts")
        do {
            if let data = try? Data(contentsOf: fileName) {
                if let decoded = try? JSONDecoder().decode([Contact].self, from: data) {
                    self.people = decoded
                    return
                }
            }
        } catch {
            print("Unable to load data")
        }
        self.people = []
    }
}

func getDocumentDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}





