import UIKit

// Video 1: Creating basic closures
    // closures are functions used as variables

let driving = {
    print("I'm driving in my car")
}

driving()

// Video 2: Accepting paremeters in a closure
    // closure don't have a name of space to define parameters as usual
    // goes inside of curly braces
    // in keyword

let drivingTo = { (place: String) in
    print("I'm driving to \(place)")
}

drivingTo("London")

// Video 3: Returning values from a closure
    // can return values, written similar to parameters

let drivingWithReturn = { (place: String) -> String in
    return "I'm driving to \(place)"
}

print(drivingWithReturn("London"))

// Video 4: Closures as parameters
    // can be used just like variables
    // can be used as parameters

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!");
}

travel(action: driving)

// Video 5: Trailing closure syntax
    // last parameter of a function can use Trailing closure syntax

travel {
    driving() // function call
}

travel(action: driving) // is the same as ^^^^^

// Video 6: Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived")
}

// function call w/ a closure that requires a parameter
travel { (place: String) in
    print("I'm going to \(place) in my car.")
}

// Video 7: Using closures as parameters when they return values
    
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Video 8: Shorthand parameters names
    // Swift knows closure's types

    // swift can provide automatic names for parameters $<fake index>
travel {
    "I'm going to \($0) in my car"
}

// Video 9: Closures with multiple parameters
    

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at $1 miles per hour."
}

// Video 10: Returning closures from functions
    // two arrows

    // almost like a pseudo name
func travel() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result = travel()
result("London")

let travel2 = travel()("London")

// Video 11: Capturing values
    // if using external values in closure
    // Swift captures them and stores them w/ closure & can be modified even if they don't exist anymore

result("London")
result("London")
result("London")
result("London")

