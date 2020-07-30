//
//  ContentView.swift
//  Drawing
//
//  Created by hawkeyeshi on 6/30/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct NamedView {
    var name: String
    var view: AnyView
    
    init<V>(name: String, view: V) where V: View {
        self.name = name
        self.view = AnyView(view)
    }
}

struct ContentView: View {
    let challengeViews = [
        NamedView(name: "Arrow", view: ArrowView()),
        NamedView(name: "Color Cycling Rectange", view: RectangleColorView())
    ]
    
    let introViews = [
        NamedView(name: "Spirograph", view: SpirographView()),
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Challenges")) {
                    ForEach(0..<challengeViews.count) { number in
                        NavigationLink(destination: self.challengeViews[number].view) {
                            Text(self.challengeViews[number].name)
                        }
                    }
                }
                Section(header: Text("Introduction")) {
                    ForEach(0..<introViews.count) { number in
                        NavigationLink(destination: self.introViews[number].view) {
                            Text(self.introViews[number].name)
                        }
                    }
                }
            }
            .navigationBarTitle("Drawing")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
