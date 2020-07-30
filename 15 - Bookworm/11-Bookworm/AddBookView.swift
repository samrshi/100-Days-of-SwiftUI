//
//  AddBookView.swift
//  Bookworm
//
//  Created by hawkeyeshi on 7/11/20.
//  Copyright © 2020 samrshi. All rights reserved.
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
    
    @State private var showingAlert = false
    
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
                }
                
                Section {
                    RatingView(rating: $rating)
                    
                    TextField("Write a review", text: $review)
                }
                
                Section {
                    Button("Save", action: saveBook)
                }
            }
            .navigationBarTitle("Add Book")
        }
        // challenge 1 - show alert if invalid
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Invalid Input"),
                  message: Text("Enter a value for all fields."),
                  dismissButton: .default(Text("OK")
                )
            )
        }
    }
    
    func saveBook() {
        // challenge 1 - validate input
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty {
            showingAlert.toggle()
            return
        }
        
        let newBook = Book(context: self.moc)
        newBook.title = self.title
        newBook.author = self.author
        newBook.rating = Int16(self.rating)
        newBook.genre = self.genre != "" ? self.genre : "Fantasy"
        newBook.review = self.review
        
        // challenge 3 - assign date
        newBook.date = Date()
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
