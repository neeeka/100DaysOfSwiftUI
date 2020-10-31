//
//  ContentView.swift
//  08 Moonshot
//
//  Created by Veronika Stefkova on 18/05/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showDate = false
    var matches = [CrewMember]()
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()    // same as –> .aspectRatio(contentMode: .fit)
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.showDate {
                            Text(mission.formattedLaunchDate)
                                .font(.subheadline)
                        } else {
                            Text(mission.crewNames(astronauts: self.astronauts))
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showDate.toggle()
                }) {
                    showDate ? Image(systemName: "person.3.fill") : Image(systemName: "calendar")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
