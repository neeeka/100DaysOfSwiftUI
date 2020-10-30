//
//  ValidatingAndDisablingForms.swift
//  10 CupcakeCorner
//
//  Created by Veronika Stefkova on 03/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ValidatingAndDisablingForms: View {
    @State var username = ""
    @State var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            Section {
                Button("Create account") {
                    print("Creating account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

struct ValidatingAndDisablingForms_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingAndDisablingForms()
    }
}
