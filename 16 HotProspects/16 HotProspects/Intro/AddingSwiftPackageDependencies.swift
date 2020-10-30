//
//  AddingSwiftPackageDependencies.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 18/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import SamplePackage

struct AddingSwiftPackageDependencies: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    var body: some View {
        Text(results)
    }
}

struct AddingSwiftPackageDependencies_Previews: PreviewProvider {
    static var previews: some View {
        AddingSwiftPackageDependencies()
    }
}
