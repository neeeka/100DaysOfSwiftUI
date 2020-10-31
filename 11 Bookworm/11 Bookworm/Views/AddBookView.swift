//
//  AddBookView.swift
//  11 Bookworm
//
//  Created by Veronika Stefkova on 18/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author's name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                    RatingView(rating: $rating)
                    TextField("Write a review", text: $review)
                }
                Section {
                    Button("Save") {
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        print("This is a book genre: \(self.genre)")
                        if self.genre == "" {
                           newBook.genre = "Unknown"
                        } else {
                            newBook.genre = self.genre
                        }
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "MMM dd, yyyy"
                        let newDate = Date()
                        let dateString = dateFormatter.string(from: newDate)
                        newBook.date = dateString
                        newBook.review = self.review
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }
                }
            }
        .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
