import UIKit

// Video 1: Creating your own structs
    // your own types
    // structs are most common way to make your own types

struct Sport {
    var name: String
}

var tennis = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Lawn tennis"

// Video 2: Computed properties
    // computed property runs some code to figure out its value

struct Game {
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic Sport"
        }
        return "\(name) is not an Olympic Sport"
    }
}

var chessBoxing = Game(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// Video 3: Property observers
    // allows you to run code before or after a property changes
    // add didSet in braces after property definition to do something after property change
    // willSet to run before property changes

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is \(amount)% complete.")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

// Video 4: Methods
    // funcs inside structs

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        population * 1000
    }
}

let london = City(population: 9000000)
london.collectTaxes()

// Video 5: Mutating methods
    // properties can't be changed if instance of struct is a constant
    // Swift doesn't know if your struct will be a var or constant in use
    // can't change properties in methods unless you explicitly mark it as a mutation

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Fred")
person.makeAnonymous()

// Video 6: Properties and methods of strings
    // strings are structs
    // have properties and methods

let string = "Do or do not, there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// Video 7: Properties and methods of arrays
    // arrays are also structs

var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted())
toys.remove(at: 0)
print(toys)

// Video 8: Initalizers
    // constructors for Swift
    // all values must have a value by end of initializer

struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user")
    }
}

var user = User()

// Video 9: Referring to the current instance
    // self

struct Baby {
    var name: String
    
    init(name: String) {
        print("/(name) was born!")
        self.name = name
    }
}

// Video 10: Lazy properties
    // performance optimization
    // some properties are only made if needed
    // familyTree won't be created until its first accessed

struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}

struct Human {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Human(name: "Ed")
ed.familyTree

// Video 11: Static properties and methods
    // static properties are shared between all instances
    // accessed with <Struct Name>.<property>
    // not with instance name

struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

// Video 12: Access control
    // restricts which code can use properties and methods
    // private keyword makes properties only accessible in methods of class

struct Guy {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        "My SSN is \(id)"
    }
}

let bob = Guy(id: "12345")
print(bob.identify())
