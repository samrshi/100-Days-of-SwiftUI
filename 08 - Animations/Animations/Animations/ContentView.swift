//
//  ContentView.swift
//  Animations
//
//  Created by hawkeyeshi on 6/12/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animate = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                self.animate.toggle()
            }
            .rotationEffect(animate ? .degrees(0) : .degrees(360))
            .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
