//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            VStack {
                Text("Gryffindor")
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            .padding()
            
            VStack {
                Text("Gryffindor")
                    .font(.largeTitle)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .font(.title)
            .padding()
            
            VStack {
                Text("Gryffindor")
                    .blur(radius: 0)
                Text("Hufflepuff")
                Text("Ravenclaw")
                Text("Slytherin")
            }
            .blur(radius: 5)
            .padding()
        }
    }
}

struct EnvironmentModifiers_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentModifiers()
    }
}
