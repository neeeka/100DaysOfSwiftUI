//
//  MKPointAnnotation-ObservableObject.swift
//  14 BucketList
//
//  Created by Veronika Stefkova on 06/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        set {
            subtitle = newValue
        }
    }
}
