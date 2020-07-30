@_private(sourceFile: "AddBookView.swift") import _1_Bookworm
import SwiftUI
import SwiftUI

extension AddBookView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 110)
        AnyView(AddBookView())
#sourceLocation()
    }
}

extension View {
    @_dynamicReplacement(for: validityOverlay()) private func __preview__validityOverlay() -> some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 104)
        return AnyView(self.modifier(ValidityOverlay(isValid: __designTimeBoolean("#4277.[3].[0].[0].modifier[0].arg[0].value.arg[0].value", fallback: true))))
#sourceLocation()
    }
}

extension ValidityOverlay {
    @_dynamicReplacement(for: body(content:)) private func __preview__body(content: Content) -> some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 97)
        AnyView(content
            .accentColor(.red))
#sourceLocation()
    }
}

extension AddBookView {
    @_dynamicReplacement(for: saveBook()) private func __preview__saveBook() {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 72)
        // validate input
        if title.isEmpty || author.isEmpty || genre.isEmpty || review.isEmpty {
            checkingValidity = true
        }
        
        let newBook = Book(context: self.moc)
        newBook.title = self.title
        newBook.author = self.author
        newBook.rating = Int16(self.rating)
        newBook.genre = self.genre != "" ? self.genre : "Fantasy"
        newBook.review = self.review
        
        do {
            try self.moc.save()
        } catch {
            print(error)
        }
        
        self.presentationMode.wrappedValue.dismiss()
#sourceLocation()
    }
}

extension AddBookView {
    @_dynamicReplacement(for: reviewIsValid) private var __preview__reviewIsValid: Bool {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 67)
        checkingValidity && !review.isEmpty
#sourceLocation()
    }
}

extension AddBookView {
    @_dynamicReplacement(for: genreIsValid) private var __preview__genreIsValid: Bool {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 63)
        checkingValidity && !genre.isEmpty
#sourceLocation()
    }
}

extension AddBookView {
    @_dynamicReplacement(for: authorIsValid) private var __preview__authorIsValid: Bool {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 59)
        checkingValidity && !title.isEmpty
#sourceLocation()
    }
}

extension AddBookView {
    @_dynamicReplacement(for: titleIsValid) private var __preview__titleIsValid: Bool {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 55)
        checkingValidity && !title.isEmpty
#sourceLocation()
    }
}

extension AddBookView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/hawkeyeshi/-dev/-Swift/100 Days of Swift/11-Bookworm/11-Bookworm/AddBookView.swift", line: 26)
        AnyView(NavigationView {
            Form {
                Section {
                    TextField(__designTimeString("#4277.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[0].value", fallback: "Name of book"), text: $title)
                        .validityOverlay()
                    TextField(__designTimeString("#4277.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[0].value", fallback: "Author's name"), text: $author)
                    
                    Picker(__designTimeString("#4277.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].value", fallback: "Genre"), selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    RatingView(rating: $rating)
                    
                    TextField(__designTimeString("#4277.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].value", fallback: "Write a review"), text: $review)
                }
                
                Section {
                    Button(__designTimeString("#4277.[1].[9].property.[0].[0].arg[0].value.[0].arg[0].value.[2].arg[0].value.[0].arg[0].value.[0].value", fallback: "Save"), action: saveBook)
                }
            }
            .navigationBarTitle(__designTimeString("#4277.[1].[9].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value.[0].value", fallback: "Add Book"))
        })
#sourceLocation()
    }
}

typealias AddBookView = _1_Bookworm.AddBookView
typealias ValidityOverlay = _1_Bookworm.ValidityOverlay
typealias AddBookView_Previews = _1_Bookworm.AddBookView_Previews