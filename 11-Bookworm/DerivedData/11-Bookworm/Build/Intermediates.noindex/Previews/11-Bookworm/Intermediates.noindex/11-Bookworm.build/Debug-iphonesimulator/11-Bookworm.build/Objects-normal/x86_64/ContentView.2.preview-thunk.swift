@_private(sourceFile: "ContentView.swift") import _1_Bookworm
import CoreData
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/ContentView.swift", line: 53)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return AnyView(ContentView().environment(\.managedObjectContext, context))
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/ContentView.swift", line: 19)
        AnyView(NavigationView {
            VStack {
                List {
                    ForEach(books, id: \.self) { book in
                        NavigationLink(destination: Text(book.title ?? "nil")) {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(__designTimeString("#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].value", fallback: "Bookworm"))
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddSheet.toggle()
                }) {
                    Image(systemName: __designTimeString("#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[1].value.[0].arg[0].value.[0].value", fallback: "plus"))
            })
                .sheet(isPresented: $showingAddSheet) {
                    AddBookView().environment(\.managedObjectContext, self.moc)
            }
        })
#sourceLocation()
    }
}

typealias ContentView = _1_Bookworm.ContentView
typealias ContentView_Previews = _1_Bookworm.ContentView_Previews