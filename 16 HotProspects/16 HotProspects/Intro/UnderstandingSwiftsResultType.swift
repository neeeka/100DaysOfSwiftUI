//
//  UnderstandingSwiftsResultType.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 17/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

enum NetworkError: Error {
    case badURL, requestFailed, unknown
}

struct UnderstandingSwiftsResultType: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                self.fetchData(from: "https://www.apple.com") { result in
                    switch result {
                    case .success(let str):
                        print(str)
                    case .failure(let error):
                        switch error {
                        case .badURL:
                            print("Bad URL")
                        case .requestFailed:
                            print("Network problems")
                        case .unknown:
                            print("Unknown error")
                        }
                    }
                }
        }
    }
    
    func fetchData(from urlString: String, completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let data = data {
                    let stringData = String(decoding: data, as: UTF8.self)
                    completion(.success(stringData))
                } else if error != nil {
                    completion(.failure(.requestFailed))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }.resume()
        
        
    }
}

struct UnderstandingSwiftsResultType_Previews: PreviewProvider {
    static var previews: some View {
        UnderstandingSwiftsResultType()
    }
}
