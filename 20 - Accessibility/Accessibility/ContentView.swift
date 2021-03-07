//
//  ContentView.swift
//  Accessibility
//
//  Created by Samuel Shi on 3/6/21.
//

import SwiftUI

struct ContentView: View {
  @State private var estimate = 25.0
  @State private var rating = 3
  
  var body: some View {
    VStack {
      // accessibility value
      Slider(value: $estimate, in: 0...50)
        .padding()
        .accessibility(value: Text("\(Int(estimate))"))
      
      // provide context for the value to be read out when stepper changes
      Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
        .accessibility(value: Text("\(rating) out of 5"))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
