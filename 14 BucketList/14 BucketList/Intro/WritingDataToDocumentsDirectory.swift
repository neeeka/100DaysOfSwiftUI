//
//  WritingDataToDocumentsDirectory.swift
//  14 BucketList
//
//  Created by Veronika Stefkova on 05/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct WritingDataToDocumentsDirectory: View {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                let str = "Text Message"
                let url = self.getDocumentsDirectory().appendingPathComponent("message.txt")
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}

struct WritingDataToDocumentsDirectory_Previews: PreviewProvider {
    static var previews: some View {
        WritingDataToDocumentsDirectory()
    }
}
