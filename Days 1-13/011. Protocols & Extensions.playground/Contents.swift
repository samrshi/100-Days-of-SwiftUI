import UIKit

// Video 1: Protocols
    // way of describing what properties and methods something should have
    // protocols are descriptions

protocol Identifiable {
    var id: String { get set }
    var name: String { get set }

}

    // we can make a struct that must conform to protocol (have correct methods and properties
struct User: Identifiable {
    var id: String
    var name: String
}

    // can have parameters of anything that confroms to protocol
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

// Video 2: Protocol Inheritance
    // you can inherit from multiple protocls

protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

    // inherits all methods and properties from other protocols
protocol Employee: Payable, NeedsTraining, HasVacation {}

// Video 3: Extensions
    // allow you to add methods to existing type that allows you them to do new things
    // teaching an old dog new tricks

extension Int {
    func squared() -> Int {
        self * self
    }
    
    func isEven() -> Bool {
        self % 2 == 0
    }
}

let number = 8
number.squared()
number.isEven()

// Video 4: Protocol Extensions
    // allow you to describe what methods a type should have, but not code inside
    // extensions provide code inside but just for one type
    // protocol extensions provide code inside for all types conforming to a protocol

    // extension <protocol name> { }
        // outside of protocol definition

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us: ")
        
        for name in self {
            print(name)
        }
    }
}

// Video 5: Protocol Oriented Programming
    // crafting code around protocols and protocol extensions
    

