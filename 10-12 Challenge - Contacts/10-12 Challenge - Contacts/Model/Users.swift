//
//  Users.swift
//  10-12 Challenge - Contacts
//
//  Created by Veronika Stefkova on 14/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation

class Users: ObservableObject {
    @Published var all = [User]()
    
    init(users: [User]) {
        self.all = users
    }
    
    init() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                 print("Invalid URL")
                 return
             }
             let request = URLRequest(url: url)
             let session = URLSession.shared.dataTask(with: request) { data, response, error in
                 if let data = data {
                     if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                         DispatchQueue.main.async {
                             self.all = decoded
                         }
                         return
                     }
                 }
                 print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
             }
        DispatchQueue.global().async {
            session.resume()
        }
    }
    
    func find(withId: String) -> User? {
        return all.first {$0.id == withId}
    }
}
