//
//  FileManager.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 27/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import Foundation
import SwiftUI

extension FileManager {
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func savePhoto(_ image: UIImage, withName name: String) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else {return}
        let url = getDocumentsDirectory().appendingPathComponent(name)
        
        do {
            try imageData.write(to: url, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadPhoto(withName name: String) -> UIImage? {
        let url = getDocumentsDirectory().appendingPathComponent(name)
        if let loadedImage = try? Data(contentsOf: url) {
            return UIImage(data: loadedImage)
        }
        return nil
    }
}
