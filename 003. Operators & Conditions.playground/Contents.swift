import UIKit

// Video 1: Arithmetic Operators
    // +, -, *, /, %

// Video 2: Operator overloading
    // What an operator does depends on types
    // Cannot mix types

let one = 1
let two = 2
let three = one + two

let hello = "hello "
let there = "there"
let helloThere = hello + there

let johnPaul = ["John", "Paul"]
let georgeRingo = ["George", "Ringo"]
let beatles = johnPaul + georgeRingo

// Video 3: Compound assignment operators
    // combing operators with assignment

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

// Video 4: Comparison Operators
    // ==, !=, <, <=, >, >=

1 < 2
"Taylor" <= "Swift" // alpabetical order
"Two" > "Top"

// Video 5: Conditions
    // if statements

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 21 {
    print("Blackjack!")
} else if firstCard + secondCard == 2 {
    print("Aces, Lucky")
} else {
    print("Regular cards")
}

// Video 6: Combining conditions
    // &&, ||

if 2 > 1 && 1 > 1 {
    print("and")
}

if 2 > 1 || 1 > 1 {
    print("or")
}

// Video 7: The ternary operator
    // rarely used
    // three values at once
    // if first value (condition) is true, returns second value
    // else, returns second

let out = firstCard == secondCard ? "Cards are the same" : "Cards are different"

// Video 8: Switch case
    // breaks by default, use fallthrhough to continue to next case

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Jacket")
    fallthrough
case "sunny":
    print("Sunscreen")
default:
    print("Enjoy your day")
}

// Video 9: Range operators
    // ..< doesn't include top value
    // ... invludes top value

let sgradecore = 85

switch score {
case 0 ..< 50:
    print("You failed")
case 50 ..< 85:
    print("You did okay")
default:
    print("You did great")
}
