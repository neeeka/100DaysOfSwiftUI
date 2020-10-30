//
//  Card.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 26/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation

struct Card: Codable, Identifiable {
    let id = UUID()
    let prompt: String
    let answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
