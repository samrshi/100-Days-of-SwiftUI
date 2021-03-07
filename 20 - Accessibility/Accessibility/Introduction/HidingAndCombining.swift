//
//  HidingAndCombining.swift
//  Accessibility
//
//  Created by Samuel Shi on 3/6/21.
//

import SwiftUI

struct HidingAndCombining: View {
  let pictures = [
    "ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096"
  ]
  
  var body: some View {
    VStack {
      // hide any view from screenreader
      Image(pictures[0])
        .accessibility(hidden: true)
      
      // hide image from screenreader and mark as decorative
      Image(decorative: pictures[1])
      
      // combine children elements for screenreader. still separate
      VStack {
        Text("Your score is")
        Text("1000")
          .font(.title)
      }
      .accessibilityElement(children: .combine)
      
      // ignore parent and then make new label to make reader flow better
      VStack {
        Text("Your score is")
        Text("1000")
          .font(.title)
      }
      .accessibilityElement(children: .ignore)
      .accessibility(label: Text("Your score is 1000"))
    }
  }
}
