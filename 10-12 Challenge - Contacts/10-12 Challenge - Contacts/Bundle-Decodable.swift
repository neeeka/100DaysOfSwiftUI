//
//  Bundle-Decodable.swift
//  10-12 Challenge - Contacts
//
//  Created by Veronika Stefkova on 12/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation

extension Bundle {
    func decode(contacts: User) -> User {
        
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
                fatalError()
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let decoded = try? JSONDecoder().decode([User].self, from: data) {
                        print("Right now in decoded")
            
                        DispatchQueue.main.async {
                            contacts = decoded
                        }
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }.resume()
        }
    }
}
