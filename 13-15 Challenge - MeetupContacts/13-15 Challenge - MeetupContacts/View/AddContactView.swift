//
//  AddContact.swift
//  13-15 Challenge - MeetupContacts
//
//  Created by Veronika Stefkova on 26/09/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreData
import CoreLocation
import MapKit

struct AddContactView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var moc
    
    @State private var contact: Contact?
    
    @State private var name = ""
    @State private var image: Image?
    @State private var uiImage: UIImage?
    @State private var longitude: Double = 0
    @State private var latutiude: Double = 0
    
    @State private var imageSourceType: ImageSourceType = .library
    
    @State private var showingImagePicker = false
    @State private var showingErrorAlert = false
    @State private var errorMessage = ""
    
    @State var currentUserLocation: CLLocationCoordinate2D?
    @State private var locationFetcher = LocationFetcher()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Picture")) {
        
                           
                        if image != nil {
                            image?
                                .resizable()
                                .scaledToFit()
                        } else {
                            ZStack() {
                                Circle()
                                
                                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, lineCap: CGLineCap.square, dash: [6, 6]))
                                    .frame(height: 150)
                                  //  .scaledToFit()
                                Text("Select Photo")
                                    .font(.headline)
                            }
                            .onTapGesture {
                                self.showingImagePicker = true
                            }

                        }
                        
                    
                    
                    
                    
                }
                
                Section(header: Text("Name")) {
                    TextField("Name", text: $name)
                }
            
            }
            .navigationBarTitle("Add New Contact")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadPicture) {
                ImagePicker(image: self.$uiImage, sourceType: self.imageSourceType)
            }
            .alert(isPresented: $showingErrorAlert) {
                Alert(title: Text(errorMessage))
            }
            .navigationBarItems(trailing: Button(action: {
                addContact()
            }, label: {
                Text("Save")
            }))
            .onAppear() {
                locationFetcher.start()
            }
        }
    }
    
    func loadPicture() {
        guard let uiImage = self.uiImage else { return }
        self.image = Image(uiImage: uiImage)
    }
 
    
    func takePictere() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imageSourceType = .camera
            self.showingImagePicker = true
        } else {
            self.errorMessage = "Camera is not available"
            self.showingImagePicker = true
        }
    }
    
    func selectPicture() {
        self.imageSourceType = .library
        self.showingImagePicker = true
    }
    
    func addContact() {
        guard !name.isEmpty else {
            errorMessage = "Name is missing"
            showingErrorAlert = true
            return
        }
        
        let newContact = Contact(context: moc)
        
        newContact.name = name
        
        if let location = locationFetcher.lastKnownLocation {
            newContact.longitude = location.longitude
            newContact.latitude = location.latitude
            newContact.locationAvailable = true
        } else {
            newContact.locationAvailable = false
        }
        
        if let uiImage = uiImage {
            newContact.imageID = UUID()
            FileManager().savePhoto(uiImage, withName: newContact.imageID!.uuidString)
        }
         
        try? moc.save()
        presentationMode.wrappedValue.dismiss()
        
        
        
    }
    
    
}
