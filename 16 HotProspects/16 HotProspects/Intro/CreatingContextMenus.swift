//
//  CreatingContextMenus.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 18/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct CreatingContextMenus: View {
    @State private var backgroungColor = Color.red
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .padding()
                    .background(backgroungColor)
                Text("Change Color")
                    .padding()
                    .contextMenu {
                        Button(action: {
                            self.backgroungColor = .red
                        }) {
                            Text("Red")
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.red)
                        }
                        
                        Button(action: {
                            self.backgroungColor = .green
                        }) {
                            Text("Green")
                        }
                        
                        Button(action: {
                            self.backgroungColor = .blue
                        }) {
                            Text("Blue")
                        }
                }
            }
        }
        
}

struct CreatingContextMenus_Previews: PreviewProvider {
    static var previews: some View {
        CreatingContextMenus()
    }
}
