import UIKit

// Consolidation Day 1

// Variables and constants

    // modifiable
    var str = "string"
    str = "something else"
        // allowed

    // unmodifiable
    let strin = "str"
        // strin = "something else"
        // is not allowed

// Types of Data (all have capitalized first letter)
    var name: String  = "Sam"
    var nam = "Sam"
    var na: String
        // all of these are allowed

    var string: String
    var integer: Int

    var float: Float // not very accurate
    var double: Double // more accurate

    var boolean: Bool

    // swift can do TYPE INFERENCE
    var bool = true
    var thisIsAString = "str"

// Operators
    //    +
    //    -
    //    *
    //    /
    //    +=
    //    -=
    //    *=
    //    /=
    //    >
    //    <
    //    >=
    //    <=
    //    ==
    //    !=
    // ++ is not allowed

var a = 10

// String interpolation
    // backslash then parentheses and expression

    var aName = "Sam"
    "Your name is \(aName)"

// Arrays
    var evenNumbers = [2,  4, 6, 8]

    type(of: evenNumbers)

    var arr: [String]

    var one = [1, 2, 3,]
    var two = [4, 5, 6]
    var both = one + two
    both += [7]

// Dictionaries
    // mix between hash map and class

    var person = [
        "first" : "Samuel",
        "middle" : "Robert",
        "last" : "Shi"
    ]

    person["first"]

// Conditionals
    var truth = true

    if truth {
        // do something
    } else if 1 == 1 {
        // do something else
    } else {
        // default
    }

// Loops

    // inclusive
    for i in 1...10 {
        print(i)
    }

    var array = [2, 3, 4, 5, 6]

    for elem in array {
        print(elem)
    }

    // non-inclusive of last elem
    for i in 0..<array.count {
        print(i)
    }

    var counter = 0

    while true {
        counter += 1
        if counter == 1 {
            break
        } else if counter == 2 {
            continue
        }
    }

    // use break to stop loops
    // use continue to go to next loop instance

// switch case
    // don't need to include 'break' because Swift breaks automatically
    // use 'fallthrough' if you want to continue to next case

let studioAlbums = 5

switch studioAlbums {
case 0...1:
    print(1)
case 2...5:
    print(2)
    fallthrough
    // will do this case and check the next
default:
    print(-1)
}
