//
//  ContentView.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 11/07/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Contact.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Contact.name, ascending: true)]) var contacts: FetchedResults<Contact>
    
    @State private var showAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(contacts, id: \.self) { contact in
                    NavigationLink(destination: DetailView(contact: contact).environment(\.managedObjectContext, self.moc)) {
                        HStack {
                            Group {
                                if contact.imageID != nil {
                                    self.loadUserImage(uuid: contact.imageID!)
                                        .resizable()
                                        .scaledToFill()
                                        .clipShape(Circle())
                                } else {
                                    Image(systemName: "person")
                                }
                            }
                            .frame(width: 32, height: 32, alignment: .center)
                            .scaledToFill()
                            
                            Text(contact.wrappedName)
                        }
                    }
                }
                .onDelete(perform: deleteContact)
                
            }
            .navigationBarTitle("Meetup Contacts")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showAddScreen = true
                })  {
                    Image(systemName: "plus")
                })
            .sheet(isPresented: $showAddScreen) {
                AddContactView()
            }
            
        }
        
        
    }
    
    func deleteContact(_ offsets: IndexSet) {
        for offset in offsets {
            let contact = contacts[offset]
            moc.delete(contact)
        }
        try? moc.save()
    }
    
    func loadUserImage(uuid: UUID) -> Image {
        if let uiImage = FileManager().loadPhoto(withName: uuid.uuidString) {
            return Image(uiImage: uiImage)
        } else {
            return Image(systemName: "person.crop.circle.fill")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
