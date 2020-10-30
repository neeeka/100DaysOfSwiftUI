//
//  ModifierOrder.swift
//  03 ViewsAndModifiers
//
//  Created by Veronika Stefkova on 01/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ModifierOrder: View {
    var body: some View {
        VStack {
            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(Color.red)
            
            Spacer()
            Text("Hello World")
            .padding()
                .background(Color.red)
            .padding()
                .background(Color.blue)
            .padding()
                .background(Color.green)
            .padding()
                .background(Color.yellow)
        }
        
    }
}

struct ModifierOrder_Previews: PreviewProvider {
    static var previews: some View {
        ModifierOrder()
    }
}
