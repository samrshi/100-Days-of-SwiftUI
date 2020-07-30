@_private(sourceFile: "ContentView.swift") import _1_Bookworm
import CoreData
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/ContentView.swift", line: 53)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return AnyView(__designTimeSelection(ContentView().environment(\.managedObjectContext, __designTimeSelection(context, "#6651.[3].[0].property.[0].[1].modifier[0].arg[1].value")), "#6651.[3].[0].property.[0].[1]"))
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/ContentView.swift", line: 19)
        AnyView(__designTimeSelection(NavigationView {
            __designTimeSelection(VStack {
                __designTimeSelection(List {
                    __designTimeSelection(ForEach(__designTimeSelection(books, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value"), id: \.self) { book in
                        __designTimeSelection(NavigationLink(destination: __designTimeSelection(Text(book.title ?? "nil"), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[0].value")) {
                            __designTimeSelection(EmojiRatingView(rating: __designTimeSelection(book.rating, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[1].value.[0].arg[0].value"))
                                .font(.largeTitle), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[1].value.[0]")
                            
                            __designTimeSelection(VStack(alignment: .leading) {
                                __designTimeSelection(Text(book.title ?? "Unknown Title")
                                    .font(.headline), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[1].value.[1].arg[1].value.[0]")
                                __designTimeSelection(Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[1].value.[1].arg[1].value.[1]")
                            }, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0].arg[1].value.[1]")
                        }, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[2].value.[0]")
                    }, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0]")
                }, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
            }
            .navigationBarTitle(__designTimeString("#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].value", fallback: "Bookworm"))
            .navigationBarItems(trailing:
                __designTimeSelection(Button(action: {
                    __designTimeSelection(self.showingAddSheet.toggle(), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[0].value.[0]")
                }) {
                    __designTimeSelection(Image(systemName: __designTimeString("#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[1].value.[0].arg[0].value.[0].value", fallback: "plus")), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value.arg[1].value.[0]")
            }, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value"))
                .sheet(isPresented: __designTimeSelection($showingAddSheet, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[0].value")) {
                    __designTimeSelection(AddBookView().environment(\.managedObjectContext, __designTimeSelection(self.moc, "#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value.[0].modifier[0].arg[1].value")), "#6651.[2].[3].property.[0].[0].arg[0].value.[0].modifier[2].arg[1].value.[0]")
            }, "#6651.[2].[3].property.[0].[0].arg[0].value.[0]")
        }, "#6651.[2].[3].property.[0].[0]"))
#sourceLocation()
    }
}

typealias ContentView = _1_Bookworm.ContentView
typealias ContentView_Previews = _1_Bookworm.ContentView_Previews