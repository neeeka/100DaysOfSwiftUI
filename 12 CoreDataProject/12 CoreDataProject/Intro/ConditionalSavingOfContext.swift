//
//  ConditionalSavingOfContext.swift
//  12 CoreDataProject
//
//  Created by Veronika Stefkova on 21/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ConditionalSavingOfContext: View {
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        }
    }
}

struct ConditionalSavingOfContext_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalSavingOfContext()
    }
}
