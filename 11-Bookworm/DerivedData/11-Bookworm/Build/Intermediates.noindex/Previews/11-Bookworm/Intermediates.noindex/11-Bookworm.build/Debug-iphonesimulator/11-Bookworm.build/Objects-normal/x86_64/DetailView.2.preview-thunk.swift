@_private(sourceFile: "DetailView.swift") import _1_Bookworm
import CoreData
import SwiftUI
import SwiftUI

extension DetailView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 84)
        let book = Book(context: moc)
        book.title = "Test book"
        book.author = "Test author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This was a great book; I really enjoyed it."
        
        return AnyView(NavigationView {
            DetailView(book: book)
        })
#sourceLocation()
    }
}

extension DetailView {
    @_dynamicReplacement(for: formatDate(date:)) private func __preview__formatDate(date: Date) -> String {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 74)
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
#sourceLocation()
    }
}

extension DetailView {
    @_dynamicReplacement(for: deleteBook()) private func __preview__deleteBook() {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 66)
        moc.delete(book)
        
        try? self.moc.save()
        
        presentationMode.wrappedValue.dismiss()
#sourceLocation()
    }
}

extension DetailView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/DetailView.swift", line: 20)
        AnyView(GeometryReader { geometry in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(self.book.genre ?? "Fantasy")
                        .frame(maxWidth: geometry.size.width)
                    
                    Text(self.book.genre?.uppercased() ?? "Fantasy")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(__designTimeInteger("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[2].arg[0].value", fallback: 8))
                        .foregroundColor(.white)
                        .background(Color.black.opacity(__designTimeFloat("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[4].arg[0].value.modifier[0].arg[0].value", fallback: 0.75)))
                        .clipShape(Capsule())
                        .offset(x: __designTimeInteger("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[6].arg[0].value", fallback: -5), y: __designTimeInteger("#7180.[2].[4].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[1].value.[1].modifier[6].arg[1].value", fallback: -5))
                }
                
                Text(self.book.author ?? "Unknown author")
                    .font(.title)
                    .foregroundColor(.secondary)
                
                Text(self.book.review ?? "No review")
                    .padding()
                
                RatingView(rating: .constant(Int(self.book.rating)))
                    .font(.largeTitle)
                
                Spacer()
                
                Text(self.formatDate(date: self.book.date ?? Date()))
                    .font(.caption)
            }
        }
        .navigationBarTitle(Text(book.title ?? "Unknown book"), displayMode: .inline)
        .alert(isPresented: $showingDeleteAlert) {
            Alert(title: Text(__designTimeString("#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[0].value.arg[0].value.[0].value", fallback: "Delete book")), message: Text(__designTimeString("#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[1].value.arg[0].value.[0].value", fallback: "Are you sure?")), primaryButton: .destructive(Text(__designTimeString("#7180.[2].[4].property.[0].[0].modifier[1].arg[1].value.[0].arg[2].value.arg[0].value.arg[0].value.[0].value", fallback: "Delete"))) {
                self.deleteBook()
                }, secondaryButton: .cancel())
        }
        .navigationBarItems(trailing: Button(action: {
            self.showingDeleteAlert = true
        }) {
            Image(systemName: __designTimeString("#7180.[2].[4].property.[0].[0].modifier[2].arg[0].value.arg[1].value.[0].arg[0].value.[0].value", fallback: "trash"))
        }))
#sourceLocation()
    }
}

typealias DetailView = _1_Bookworm.DetailView
typealias DetailView_Previews = _1_Bookworm.DetailView_Previews