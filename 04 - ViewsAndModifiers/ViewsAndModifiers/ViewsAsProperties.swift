//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ViewsAsProperties: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    var motto3: some View {
        Text("Draco dormiens")
    }

    var body: some View {
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ViewsAsProperties_Previews: PreviewProvider {
    static var previews: some View {
        ViewsAsProperties()
    }
}
