//
//  DetailView.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 24/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    var contact: Contact
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                Text(contact.wrappedName)
            }
            Section(header: Text("Photo")) {
                HStack {
                    Spacer()
                    loadUserImage(uuid: contact.imageID)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Spacer()
                }
            }
            Section(header: Text("Location")) {
                if contact.locationAvailable {
                    MapView(annotation: loadAnnotation())
                        .scaledToFit()
                } else {
                    Text("Location is not available for this person")
                }
            }
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }, label: {
            Image(systemName: "trash")
        }))
        
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text("Delete contact"), message: Text("Are you sure you want to delete this contact?"), primaryButton: .destructive(Text("Delete")) {
                self.deleteContact()
            }, secondaryButton: .cancel())
        }
    }
    

    
    func loadUserImage(uuid: UUID?) -> Image {
        if let uuid = uuid {
            
            if let uiImage = FileManager().loadPhoto(withName: uuid.uuidString) {
                return Image(uiImage: uiImage)
            }
        }
        
        return Image(systemName: "person")
        
    }
    
    func loadAnnotation() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: contact.latitude, longitude: contact.longitude)
        return annotation
    }
    
    func deleteContact() {
        moc.delete(contact)
        presentationMode.wrappedValue.dismiss()
    }
    
    
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(contact: Contact())
    }
}
