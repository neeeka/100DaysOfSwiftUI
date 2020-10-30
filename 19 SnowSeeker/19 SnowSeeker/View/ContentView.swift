//
//  ContentView.swift
//  19 SnowSeeker
//
//  Created by Veronika Stefkova on 04/08/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

enum SortOrder: String, CaseIterable {
    // CaseIterable -> Self.AllCases - represent a collection of all values of this type
    case original = "By Default"
    case alphabetical = "Alphabetically"
    case country = "By Country"
}

enum FilteredResort {
    case austria, canada, france, italy, us, all
}

struct ContentView: View {
    @ObservedObject var favorites = Favorites()
    
    @State private var sortOrder: SortOrder = .original
    
    @State private var filterByCountry = ""
    @State private var filterBySize = 0
    @State private var filterByPrice = 0
    
    @State private var showingFilterSheet = false
    
    let resorts: [Resort]  = Bundle.main.decode("resorts.json")
    
    var filteredResorts: [Resort] {
        var tempResorts = resorts
        
        switch filterByCountry {
            case "":
                break
            default:
                tempResorts = tempResorts.filter {$0.country == filterByCountry }
        }
        
        switch filterBySize {
            case 1,2,3:
                tempResorts = tempResorts.filter {$0.size == self.filterBySize }
            default:
                break
        }
        
        switch filterByPrice {
        case 1,2,3:
            tempResorts = tempResorts.filter { $0.price == self.filterByPrice }
        default:
            break
        }
        return tempResorts
    }
    
    var sortedResorts: [Resort] {
        switch sortOrder {
            case .original:
                return filteredResorts
            case .alphabetical:
                return filteredResorts.sorted { $0.name < $1.name }
            case .country:
                return filteredResorts.sorted { $0.country < $1.country }
        }
    }
      
    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image(resort.country)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 25)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.black, lineWidth: 1))
                    VStack(alignment: .leading) {
                        Text(resort.name)
                            .font(.headline)
                        Text("\(resort.runs) runs")
                            .foregroundColor(.secondary)
                            
                    }.layoutPriority(1)
                    if self.favorites.contains(resort) {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .accessibility(label: Text("This is a favorite resort"))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(trailing: Button(action: {
                self.showingFilterSheet = true
            }, label: {
                Image(systemName: "line.horizontal.3.decrease.circle")
            })
            
            )
            WelcomeView()
        }
        .environmentObject(favorites)
        .sheet(isPresented: $showingFilterSheet) {
            FilterView(resorts: resorts, sortingSelection: self.$sortOrder, filterByCountry: self.$filterByCountry, filterBySize: self.$filterBySize, filterByPrice: self.$filterByPrice)
        }

        
        .phoneOnlyStackNavigationView()
        
    }
}


extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
