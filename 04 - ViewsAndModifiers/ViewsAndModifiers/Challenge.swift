//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 6/4/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.blue)
            .font(.title)
    }
}

extension View {
    func title() -> some View {
        self.modifier(BlueTitle())
    }
}

struct Challenge: View {
    var body: some View {
        Text("Hello World")
            .title()
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
