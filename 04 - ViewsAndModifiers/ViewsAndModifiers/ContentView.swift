//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 6/4/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let views = [
        (title: "What is behind the main SwiftUI view?", view: AnyView(WhatsBehindTheView())),
        (title: "Why modifier order matters", view: AnyView(OrderMatters())),
        (title: "Why does SwiftUI use 'some View' for its view type?", view: AnyView(WhyUseSomeView())),
        (title: "Condiitional modifiers", view: AnyView(ConditionalModifiers())),
        (title: "Environment modifiers", view: AnyView(EnvironmentModifiers())),
        (title: "Views as properties", view: AnyView(ViewsAsProperties())),
        (title: "View composition", view: AnyView(ViewComposition())),
        (title: "Custom modifiers", view: AnyView(CustomModifiers())),
        (title: "Custom containers", view: AnyView(CustomContainers())),
        (title: "Challenge", view: AnyView(Challenge()))
    ]
    
    var body: some View {
        NavigationView {
            List(views, id: \.view.id) { view in
                NavigationLink(destination: view.view) {
                    Text(view.title)
                }
            }
            .navigationBarTitle("Views and Modifiers")
        }
    }
}

extension AnyView {
    var id: UUID {
        UUID()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
