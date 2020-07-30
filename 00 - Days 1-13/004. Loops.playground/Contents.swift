import UIKit
import Darwin

// Video 1: For loops

let count = 1...10

for number in count {
    print("Number is \(number)")
}

let albums = ["1989", "Red", "Reputation"]

for album in albums {
    print("\(album) is on Apple Music")
}

print("Players gonna")

    // Use underscore for unused values
for _ in 1...5 {
    print("Play")
}

// Video 2: While loops

var number = 1

while number <= 20 {
    print(number)
    number += 1
}

print("ready or not")

// Video 3: Repeat loops
    // not common
    // but simple
    // will always be executed at least once

repeat {
    print(number)
    number += 1
} while number <= 20

// Video 4: Exiting loops
    // break keyword
    // ends loop

var countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("I'm bored, lets go now")
        break
    }
    
    countDown -= 1
}

// Video 5: Exiting multiple loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye")
            break outerLoop
        }
    }
}

// Video 6: Skipping items
    // continue keyword

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    print(i)
}

// Video 7: Infinite loops

var counter = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}

func isSqrt(num: Double) -> Bool {
    if sqrt(num) == floor(sqrt(num)) {
        return true
    }
    return false
}

func isCbrt(num: Double) -> Bool {
    if sqrt(num) == floor(cbrt(num)) {
        return true
    }
    return false
}


for i in 1...INT_MAX {
    if isSqrt(num: Double(i - 1)) {
        print(i)
    }
}

