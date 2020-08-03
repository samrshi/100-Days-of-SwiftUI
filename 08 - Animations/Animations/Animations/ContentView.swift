//
//  ContentView.swift
//  Animations
//
//  Created by hawkeyeshi on 6/12/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let views = [
        (title: "Creating implicit animations", view: AnyView(CreatingImplicitAnimations())),
        (title: "Customizing animations in SwiftUI", view: AnyView(CustomizingAnimations())),
        (title: "Animating bindings", view: AnyView(AnimatingBindings())),
        (title: "Creating explicit animations", view: AnyView(CreatingExplicitAnimations())),
        (title: "Controlling the animation stack", view: AnyView(AnimationStack())),
        (title: "Animating gestures", view: AnyView(AnimatingGetures())),
        (title: "Showing and hiding views with transitions", view: AnyView(Transitions())),
        (title: "Building custom transitions using ViewModifier", view: AnyView(CustomTransitions()))
    ]
    
    var body: some View {
        NavigationView {
            List(views, id: \.view.id) { view in
                NavigationLink(destination: view.view) {
                    Text(view.title)
                }
            }
        .navigationBarTitle("Animations")
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
