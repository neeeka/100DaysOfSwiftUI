//
//  ShowingAndHidingViews.swift
//  07 iExpense
//
//  Created by Veronika Stefkova on 15/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button("Dismiss") {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct ShowingAndHidingViews: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView()
        }
    }
}

struct ShowingAndHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingViews()
    }
}
