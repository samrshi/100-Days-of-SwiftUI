//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 6/4/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.blue)
            .font(.title)
    }
}

extension View {
    func title() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .title()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
