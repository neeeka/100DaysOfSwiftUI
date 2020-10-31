//
//  ProspectsView.swift
//  16 HotProspects
//
//  Created by Veronika Stefkova on 19/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    enum SortType {
        case name, recent
    }
    
    
    @EnvironmentObject var prospects: Prospects
    @State private var isShowingScanner = false
    @State private var showingSortSheet = false
    
    let randomName = ["Amiyah Hart\nAmiyah@Hart.com", "Roza Lim\nRoza@Lim.com", "Habibah Valenzuela\nHabibah@Valenzuela.com", "Shaun O'Moore\nShaun@O'Moore.com", "Qasim Hendricks\nQasim@Hendricks.com", "Philip North\nPhilip@North.com", "Monika Sharp\nMonika@Sharp.com", "Elli Wilcox\nElli@Wilcox.com", "Maxime Peters\nMaxime@Peters.com", "Darryl Ventura\nDarryl@Ventura.com"]
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    @State var sort: SortType = .recent
    
    var filteredSortedProspects: [Prospect] {
        switch sort {
        case .name:
            return filteredProspects.sorted {$0.name < $1.name }
        case .recent:
            return filteredProspects.sorted {$0.date > $1.date }
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredSortedProspects) { prospect in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: prospect.isContacted ? ("checkmark.circle") : "questionmark.diamond")
                            .foregroundColor(prospect.isContacted ? .green : .orange)
                        
                    }
                    
                    .contextMenu {
                        Button(prospect.isContacted ? "Mark Uncontacted" : "Mark Contacted") {
                            self.prospects.toggle(prospect)
                        }
                        if !prospect.isContacted {
                            Button("Remind Me") {
                                self.addNotification(for: prospect)
                            }
                        }
                    }
                }
            }
                .navigationBarTitle(title)
            .navigationBarItems(leading: Button(action: {
                self.showingSortSheet = true
            }) {
                Image(systemName: "arrow.up.arrow.down")
            }, trailing: Button(action: {
                self.isShowingScanner = true
            }) {
                Image(systemName: "qrcode.viewfinder")
                Text("Scan")
            })
                
            
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr], simulatedData: self.randomName.randomElement()!, completion: self.handleScan)
                        
            }
            .actionSheet(isPresented: $showingSortSheet) {
                    ActionSheet(title: Text("Sort users by:"), buttons: [
                        .default(Text("name"), action: { self.sort = .name }),
                        .default(Text("most recent"), action: { self.sort = .recent })
                    ])
            }
        }
        
    }
    
    func handleScan(result: Result<String, CodeScannerView.ScanError>) {
        self.isShowingScanner = false
        switch result {
        case .success(let code):
            let details = code.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            self.prospects.add(person)
        case .failure(let error):
            print("Scanning failed")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            // will trigger at 9 a.m.
     //       var dateComponents = DateComponents()
     //       dateComponents.hour = 9
     //       let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print("Doh")
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
