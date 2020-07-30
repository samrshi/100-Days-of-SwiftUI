import UIKit

// Video 1: Creating Your Own Classes
    // similar to structs

    // don't come with member-wise initializer, need to make your own
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func makeNoise() {
        print("Woof")
    }
}

let boone = Dog(name: "Boone", breed: "Vizsla")

// Video 2: Class inheritance
    // you can create a class based on another class
    // inherits properties and methods of parent/super class
    // child class

    // you have to call parent/super initializer within child initializer

class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }
    
    override func makeNoise() {
        print("Yip")
    }
    
    
}

// Video 3: Overriding methods
    // can replace parent methods with own implementations
    // 'override func'
    // ^^^^^^^^ look in Poodle class

class Vizsla: Dog {
    init(name: String) {
        super.init(name: name, breed: "Vizsla")
    }
    
    override func makeNoise() {
        print("Bruh")
    }
}

let poppy = Poodle(name: "Poppy")
poppy.makeNoise()

let levi = Vizsla(name: "Levi")
levi.makeNoise()

// Video 4: Final classses
    // you can disallow other people from creating a class based on your class
    // 'final' keyword
    // can't override methods and have to use your class how it is written

final class Pitbull {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

// Video 5: Copying objects
    // when you copy a struct, they are independent
    // with classes, both point to same object, like TypeScript
    // changing properties of one with change the other

class Singer {
    var name: String = "Ed"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Joe"

print(singer.name)

// Video 6: Deinitializers
    // classes can have code that runs when an object is destroyed
    // deinit keyword, no parenthesis

class Person {
    var name = "Ed"
    
    init() {
        print("\(name) is alive!")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more.")
    }
}

for _ in 1...3 {
    let person = Person()
    person.printGreeting()
}

// Video 7: Mutability
    // constant objects can have variable properties changed
    // we don't need mutability
    // if you don't want a property to change it needs to be a constant (let)

let person = Person()
person.name = "Ed"
print(person.name)




