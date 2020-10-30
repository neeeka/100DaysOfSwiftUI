//
//  Utils.swift
//  17 Flashzilla
//
//  Created by Veronika Stefkova on 16/10/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width: 0, height: offset * 10))
    }
}

