//
//  UserJSON.swift
//  10-12 Challenge - ContactsWithCoreData
//
//  Created by Veronika Stefkova on 16/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation

struct UserJSON: Codable, Identifiable {
    var id: String
    var name: String
    var company: String
    var age: Int
    var address: String
    var email: String
    var friends: [FriendJSON]

}
