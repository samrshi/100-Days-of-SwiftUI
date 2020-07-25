import UIKit

// Video 1: Arrays
    // Arrays use brackets

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles: [String] = [john, paul, george, ringo] // Makes the array

// Video 2: Sets
    // Random order, all items are unique, will discard unoriginal values

let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red"])

// Video 3: Tuples
    // Several values together in on value
    // Cannot add or remove values, fixed amount (Arrays in C++)
    // Can't change type of values in a Tuple
    // You can access specific values

var name = (first: "Taylor", last: "Swift") // This is a Tuple
name.0
name.first = "Sam"
name

// Video 4: Arrays vs. Sets vs. Tuples
    // Distinct Uses

    // Tuple -> Specific fixed collection of related values where each item has a fixed postion or name
let address = (house: 555, street: "Taylor Swift Ave", city: "Nashville")

    // Set -> If you need a collection of values that must be unique or if you need to check if something is inside quickly
let set = Set(["aardvark", "astronaut", "azalea"])

    // Arrays -> Can contain duplicates or need specific locations (Most Common)
let pythons = ["Eric", "Graham", "John"]

// Video 5: Dictionaries
    // Collections of values like array but values are accessible using anything, usually strings
    // let <name>: [<Type 1>: <Type 2>] = [...]

let heights: [String: Double] = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Taylor Swift"]

// Video 6: Dictionary Default Values
    // Trying to read value from dictionary w/ key that doesn't exist
    // Would usually return nil, but you can make it return default value

let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"] // returns nil
favoriteIceCream["Charlotte", default: "Unknown"] // returns "Unknown"

// Video 7: Creating Empty Collections
    // Arrays, Sets, and Dictionaries collect many values in one place
    // Can create empty collections
    // Dictionaries and Arrays -> ()
    // Set -> <>

    // Dictionary
var teams = [String: String]()
teams["Paul"] = "Red"

    // Array
var results = [Int]()

    // Set
var numbers = Set<Int>()

    // Can also
var scores = Dictionary<String, Int>()
var results1 = Array<Int>()

// Video 8: Enumerations
    // "enums"
    // Groups of related values in a way that makes them easier to use
    // Stops you from using different but similar values each time

let result = "failure"
let result2 = "failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure

// Video 9: Enum Associated Values
    // values attached to each case
    // further specification

enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "Football")

// Video 10: Enum raw values
    // need to be able to assign values to enums so that they have meaning
    // automatically assigns values based on first value

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

// Video 11: Complex Data Types Summary
