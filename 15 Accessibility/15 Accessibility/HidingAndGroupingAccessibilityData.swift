//
//  HidingAndGroupingAccessibilityData.swift
//  15 Accessibility
//
//  Created by Veronika Stefkova on 08/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct HidingAndGroupingAccessibilityData: View {
    var body: some View {
//     Image(decorative: "character")
//         .accessibility(hidden: true)
              VStack {
                  Text("Your score is")
                  Text("1000")
                      .font(.title)
              }
          //    .accessibilityElement(children: .combine)
                  .accessibilityElement(children: .ignore)
                  .accessibility(label: Text("Your score is 1000"))
    }
}

struct HidingAndGroupingAccessibilityData_Previews: PreviewProvider {
    static var previews: some View {
        HidingAndGroupingAccessibilityData()
    }
}
