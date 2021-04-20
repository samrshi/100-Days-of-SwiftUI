//
//  ContentView.swift
//  Bookworm
//
//  Created by hawkeyeshi on 7/9/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(entity: Book.entity(), sortDescriptors: [
    NSSortDescriptor(keyPath: \Book.title, ascending: true),
    NSSortDescriptor(keyPath: \Book.author, ascending: true)
  ]) var books: FetchedResults<Book>
  
  @State private var showingAddSheet = false
  
  var body: some View {
    NavigationView {
      VStack {
        List {
          ForEach(books, id: \.self) { book in
            NavigationLink(destination: DetailView(book: book)) {
              EmojiRatingView(rating: book.rating)
                .font(.largeTitle)
              
              VStack(alignment: .leading) {
                Text(book.title ?? "Unknown Title")
                  .font(.headline)
                  // challenge 2
                  .foregroundColor(book.rating == 1 ? .red : .primary)
                
                Text(book.author ?? "Unknown Author")
                  .foregroundColor(.secondary)
              }
            }
          }
          .onDelete(perform: deleteBooks)
        }
      }
      .navigationBarTitle("Bookworm")
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button(action: {
          self.showingAddSheet.toggle()
        }) {
          Image(systemName: "plus")
        }
      )
      .sheet(isPresented: $showingAddSheet) {
        AddBookView().environment(\.managedObjectContext, self.moc)
      }
    }
  }
  
  func deleteBooks(at offsets: IndexSet) {
    for offset in offsets {
      let book = books[offset]
      
      moc.delete(book)
      
      do {
        try moc.save()
      } catch {
        print(error)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    return ContentView().environment(\.managedObjectContext, context)
    
  }
}
