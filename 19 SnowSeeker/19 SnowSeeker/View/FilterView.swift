//
//  FilterView.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 22/10/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var resorts: [Resort]
    
    @Binding var sortingSelection: SortOrder
    @Binding var filterByCountry: String
    @Binding var filterBySize: Int
    @Binding var filterByPrice: Int
    
    
    
    private var countries: [String] {
        Set(resorts.map { $0.country }).sorted()
    }
    
    private var prices: [Int] {
        Set(resorts.map { $0.price }).sorted()
    }
    
    private var sizes: [Int] {
        Set(resorts.map { $0.size }).sorted()
    }
    
    func formatedSize(_ size: Int) -> String {
        switch size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        default:
            return "Large"
        }
    }
    
    func formatedPrice(_ price: Int) -> String {
        String(repeating: "$", count: price)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Sort Option")) {
                    Picker(selection: $sortingSelection, label: Text("Sort by")) {
                        ForEach(SortOrder.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                Section(header: Text("Filter")) {
                    Picker(selection: $filterByCountry, label: Text("Country")) {
                        Text("All").tag("")
                        ForEach(countries, id: \.self) {
                            Text($0).tag($0)
                        }
                    }
                    
                    
                    Picker(selection: $filterBySize, label: Text("Size")) {
                        Text("All").tag(0)
                        ForEach(sizes, id: \.self) {
                            Text(self.formatedSize($0)).tag($0)
                        }
                    }
                    
                    
                    Picker(selection: $filterByPrice, label: Text("Price")) {
                        Text("All").tag(0)
                        ForEach(prices, id: \.self) {
                            Text(self.formatedPrice($0)).tag($0)
                        }
                    }
                    
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Done") {
                self.presentationMode.wrappedValue.dismiss()
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
}

