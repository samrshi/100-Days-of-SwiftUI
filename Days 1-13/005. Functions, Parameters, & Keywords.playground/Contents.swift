import UIKit

// Video 1: Writing functions
    // reuse code

func printHelp() {
    let messsage = """
Welcome to MyApp!
"""
print(messsage)
}

printHelp()

// Video 2: Accepting parameters
    // customizable functions

func square(number: Int) {
    print(number * number)
}

square(number: 8)

// Video 3: Returning values
    // sending back data
    // -> <return type>
    // Tuples are good for returning multiple values

func squareReturn(number: Int) -> Int {
    return number * number
}

let result = squareReturn(number: 8)
print(result)

// Video 4: Parameter labels
    // can have two names seperated by a space
    // first name is what is seen in function call, second is used in func body

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "Taylor")

// Video 5: omitting parameter labels
    // using _
    // good practice to use labels, but not necessary

func greet(_ person: String) {
    print("Hello, \(person)!")
}

greet("Sam")

// Video 6: default parameters
    // = after type

func welcome(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Welcome, \(person)!")
    } else {
        print("Oh no this person again")
    }
}

welcome("Taylor")
welcome("Sam", nicely: false)

// Video 7: Variadic functions
    // accept any number of parameters of same type

func square(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}

square(numbers: 1, 2, 3, 4, 5, 6)

// Video 8: Writing throwing functions
    // throwing errors when something goes wrong

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

// Video 9: Running throwing functions
    // Swift doesn't like errors
    // do, try, and catch keywords

    // do block where an error could be thrown,
    // will try the command
    // if it throws, an error, it will go into catch

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password")
}

// Video 10: inout parameters
    // paramets are constants by default
    // can be changed with inout keyword
    // change variable it was given too
    // you need to yuse & to show that you know it is inout

func doubleInPlace(number: inout Int) {
    number += 2
}

var myNum = 10
doubleInPlace(number: &myNum)
