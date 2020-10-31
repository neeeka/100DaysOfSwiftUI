//
//  SelfInForEach.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 21/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct SelfInForEach: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        List(students, id: \.self) { student in
            Text(student.name)
        }
    }
}

struct SelfInForEach_Previews: PreviewProvider {
    static var previews: some View {
        SelfInForEach()
    }
}
