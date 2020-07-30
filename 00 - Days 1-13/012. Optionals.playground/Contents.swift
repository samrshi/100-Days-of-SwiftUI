import UIKit

// Video 1: Handling Missing Data
    // Swift's solution to handling unknown data is OPTIONALS
    // ? after type
    
var age: Int? = nil
    // can later be used
age = 38

// Video 2: Unwrapping optionals
    // optional variables can hold a value or be empty, nil
    // can't do things with empty variables
    // unwrap to look inside and see if there is something there

var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name")
}
    // if name holds a string, it will be put inside of unwrapped and code will run
    // if its empty, it will run else block

// Video 3: Unwrapping w/ guard
    // alternative to if let = guard let
    // also unwraps
    // unwrap for you but if its empty, expects you to exit function, conditional, or let
    // optional stays around after checking
    // allows you to check for problems at beginning and proceed if you can

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name")
        return
    }
    
    print("Hello, \(unwrapped)")
}

// Video 4: Force unwrapping
    // convert something from optional to not optional if you known it has a value
    // "crash operator"
    // !

let str = "5"
let num = Int(str)!

    // num is an optional int because it doesn't know if str can be converted to an int
    // you can add an ! after variable definition if you want to force unwrap it
        // if it doesn't work it will throw an error
        // only do this when you know its safe

// Video 5: Implicitly unwrapped optionals
    // may or may not contain a value
    // don't need to unwrap them in order to use them
    // use them as if they aren't optional at all

    // ! after type name

let time: Int! = nil
    // don't need to if let or guard let to use them
    // if they're empty your code will crash

// Video 5: Nil coalescing
    // unwraps optional
        // returns value if not empty
        // returns default value if empty

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

// if receives a value, takes the value
// else takes "Anonymous"
let user = username(for: 15) ?? "Anonymous"


// Video 6: Optional Chaining
    // in a chain, if an optional value is nil it will return nill

let beatles = ["John", "Paul", "George", "Ringo"]
beatles.first?.uppercased()

let band: [String] = []
band.first?.uppercased()

// Video 7: Optional try

    // from function video
    // throws error if your password is "password"

    // using try? in closure that does different things if it throws an error or not

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

    // or you can use try! if you know it won't fail
try! checkPassword(";askldfja;")
print("Ok!")

// Video 8: Failable initializers
    // if it doesn't pass condition it will won't create instance of struct

let string = "5"
let number = Int(string)

struct Person {
    var id: String
    
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let sam = Person(id: "123")
let morgan = Person(id: "123456789")
morgan?.id

// Video 9: Typecasting
    // swift always needs to know types of your variables
    // as? returns an optional

class Animal {}
class Fish: Animal {}
class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}

// Video 10: Optionals Summary
    // optionals let up represent absence of a value
    // swift won't let us use optionals without unwrapping them, either using if let or guard let
    // you can force an unwrap but if you force an unwrap on nil it will crash
    // implicitly unwrapped optionals don't have the unwrapped checks of regular optionals
    // you can use nil coalescing to unwrap an optional and provide a default value if it was empty
    // you can use try? to convert a throwing function into an optional return value, or try! to crash if an error is thrown
    // if you need your initializer to fail when it gets a bad input, use init?()
    // you can use typecasting to convert one type of object to another
