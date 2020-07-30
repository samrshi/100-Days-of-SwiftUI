@_private(sourceFile: "DetailView.swift") import _1_Bookworm
import CoreData
import SwiftUI
import SwiftUI

extension DetailView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 84)
        let book = Book(context: __designTimeSelection(moc, "#7180.[3].[1].property.[0].[0].value.arg[0].value"))
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        
        return AnyView(__designTimeSelection(NavigationView {
            __designTimeSelection(DetailView(book: __designTimeSelection(book, "#7180.[3].[1].property.[0].[6].arg[0].value.[0].arg[0].value")), "#7180.[3].[1].property.[0].[6].arg[0].value.[0]")
        }, "#7180.[3].[1].property.[0].[6]"))
#sourceLocation()
    }
}

extension DetailView {
    @_dynamicReplacement(for: formatDate(date:)) private func __preview__formatDate(date: Date) -> String {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 74)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return __designTimeSelection(formatter.string(from: __designTimeSelection(date, "#7180.[2].[6].[2].modifier[0].arg[0].value")), "#7180.[2].[6].[2]")
#sourceLocation()
    }
}

extension DetailView {
    @_dynamicReplacement(for: deleteBook()) private func __preview__deleteBook() {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 66)
        __designTimeSelection(moc.delete(__designTimeSelection(book, "#7180.[2].[5].[0].modifier[0].arg[0].value")), "#7180.[2].[5].[0]")
        
        try? self.moc.save()
        
        __designTimeSelection(presentationMode.wrappedValue.dismiss(), "#7180.[2].[5].[2]")
#sourceLocation()
    }
}

extension DetailView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 20)
        AnyView(__designTimeSelection(GeometryReader { geometry in
            __designTimeSelection(VStack {
                __designTimeSelection(ZStack(alignment: .bottomTrailing) {
                    __designTimeSelection(Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: __designTimeSelection(geometry.size.width, "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0].modifier[0].arg[0].value")), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[0]")
                    
                    __designTimeSelection(Text(self.book.genre?.uppercased() ?? "Fantasy")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(__designTimeInteger("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[2].arg[0].value", fallback: 8))
                        .foregroundColor(.white)
                        .background(__designTimeSelection(Color.black.opacity(__designTimeFloat("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.75)), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[4].arg[0].value"))
                        .clipShape(__designTimeSelection(Capsule(), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[5].arg[0].value"))
                        .offset(x: __designTimeInteger("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[6].arg[0].value", fallback: -5), y: __designTimeInteger("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[6].arg[1].value", fallback: -5)), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1]")
                }, "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0]")
                
                __designTimeSelection(Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[1]")
                
                __designTimeSelection(Text(self.book.review ?? "No review")
                    .padding(), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[2]")
                
                __designTimeSelection(RatingView(rating: .constant(__designTimeSelection(Int(__designTimeSelection(self.book.rating, "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[0].value.arg[0].value.arg[0].value")), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3].arg[0].value.arg[0].value")))
                    .font(.largeTitle), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[3]")
                
                __designTimeSelection(Spacer(), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[4]")
                
                __designTimeSelection(Text(__designTimeSelection(self.formatDate(date: self.book.date ?? Date()), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[5].arg[0].value"))
                    .font(.caption), "#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[5]")
            }, "#7180.[2].[4].property.[0].[0].arg[0].value.[0]")
        }
        .navigationBarTitle(__designTimeSelection(Text(book.title ?? "Unknown book"), "#7180.[2].[4].property.[0].[0].modifier[0].arg[0].value"), displayMode: .inline)
        .alert(isPresented: __designTimeSelection($showingDeleteAlert, "#7180.[2].[4].property.[0].[0].modifier[1].arg[0].value")) {
            __designTimeSelection(Alert(title: __designTimeSelection(Text(__designTimeString("#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[0].value.arg[0].value.[0].value", fallback: "Delete book")), "#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[0].value"), message: __designTimeSelection(Text(__designTimeString("#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[1].value.arg[0].value.[0].value", fallback: "Are you sure?")), "#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[1].value"), primaryButton: .destructive(__designTimeSelection(Text(__designTimeString("#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[2].value.arg[0].value.arg[0].value.[0].value", fallback: "Delete")), "#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[2].value.arg[0].value")) {
                self.deleteBook()
                }, secondaryButton: .cancel()), "#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0]")
        }
        .navigationBarItems(trailing: __designTimeSelection(Button(action: {
            self.showingDeleteAlert = true
        }) {
            __designTimeSelection(Image(systemName: __designTimeString("#7180.[2].[4].property.[0].[0].modifier[2].arg[0].value.arg[1].value.[0].arg[0].value.[0].value", fallback: "trash")), "#7180.[2].[4].property.[0].[0].modifier[2].arg[0].value.arg[1].value.[0]")
        }, "#7180.[2].[4].property.[0].[0].modifier[2].arg[0].value")), "#7180.[2].[4].property.[0].[0]"))
#sourceLocation()
    }
}

typealias DetailView = _1_Bookworm.DetailView
typealias DetailView_Previews = _1_Bookworm.DetailView_Previews