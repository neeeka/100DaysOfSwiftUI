//
//  DeletingItems.swift
//  07 iExpense
//
//  Created by Veronika Stefkova on 16/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct DeletingItems: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: removeRows) // onDelete works only with ForEach
                }
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            .navigationBarItems(leading: EditButton())

        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct DeletingItems_Previews: PreviewProvider {
    static var previews: some View {
        DeletingItems()
    }
}
