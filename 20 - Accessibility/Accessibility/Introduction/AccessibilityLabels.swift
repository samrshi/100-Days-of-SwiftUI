//
//  AccessibilityLabels.swift
//  Accessibility
//
//  Created by Samuel Shi on 3/6/21.
//

import SwiftUI

struct AccessibilityLabels: View {
  let pictures = [
    "ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096"
  ]
  let labels = [
    "Tulips",
    "Frozen tree buds",
    "Sunflowers",
    "Fireworks"
  ]
  
  @State private var selectedPicture = Int.random(in: 0...3)
  
  var body: some View {
    Image(pictures[selectedPicture])
      .resizable()
      .scaledToFit()
      .onTapGesture {
        self.selectedPicture = Int.random(in: 0...3)
      }
      .accessibility(label: Text(labels[selectedPicture]))
      .accessibility(addTraits: .isButton)
      .accessibility(removeTraits: .isImage)
  }
}
