//
//  DataManager.swift
//  10-12 Challenge - ContactsWithCoreData
//
//  Created by Veronika Stefkova on 16/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation
import CoreData

struct DataManager {
    static func fetchData(completion: @escaping ([UserJSON]) -> ()) {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode([UserJSON].self, from: data)
                completion(decoded)
        } catch let decodingError {
            print("Decoding failed: \(decodingError.localizedDescription)")
            }
        }
        session.resume()
    }
    
    static func loadData(moc: NSManagedObjectContext) { // moc is from main thread
        DispatchQueue.global().async {
            fetchData { users in
                DispatchQueue.main.async {
                  var newUsers = [User]()
                    for user in users {
                        let newUser = User(context: moc)
                        newUser.id = user.id
                        newUser.name = user.name
                        newUser.company = user.company
                        newUser.age = Int16(user.age)
                        newUser.address = user.address
                        newUser.email = user.email
                        
                        newUsers.append(newUser)
                    
                    }
                    for i in 0..<users.count {
                        for friend in users[i].friends {
                            if let newFriend = newUsers.first(where: { $0.id == friend.id }) {
                                newUsers[i].addToFriend(newFriend)
                            }
                        }
                    }
                    do {
                        try moc.save()
                    } catch let error {
                        print("Could not save data \(error.localizedDescription)")
                    }
                }
                
            }
        }
        
    }
}
