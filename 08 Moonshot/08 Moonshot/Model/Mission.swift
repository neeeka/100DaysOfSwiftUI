//
//  Mission.swift
//  08 Moonshot
//
//  Created by Veronika Stefkova on 18/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    func crewNames(astronauts: [Astronaut]) -> String {
        var allCrew = ""
        for member in crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                allCrew += match.name + "\n"
            } else {
                fatalError("Crew member \(member.name) not found")
            }
        }
        return String(allCrew.dropLast())
    }
}
