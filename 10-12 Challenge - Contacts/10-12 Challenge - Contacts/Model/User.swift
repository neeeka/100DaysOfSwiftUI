//
//  User.swift
//  10-12 Challenge - Contacts
//
//  Created by Veronika Stefkova on 27/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation

struct User: Identifiable, Codable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var friends: [Friend]   
}



