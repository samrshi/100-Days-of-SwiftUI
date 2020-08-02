//
//  PropertyWrappersAsStructs.swift
//  Instafilter
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct PropertyWrappersAsStructs: View {
    @State private var blurAmount: CGFloat = 0 {
        didSet {
            print("New value is \(blurAmount)")
            // this doesn't work because the @State property wrapper wraps the variable in a State struct making it a "State string"
            // because of this, changing the State variable doesn't change the struct, but the wrapped value that SwiftUI stores in memory to be freely changed
            // because of this, our didSet on the @State variable won't be triggered because the struct itself doesn't actually change
        }
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            Slider(value: $blurAmount, in: 0...20)
        }
    }
}

struct PropertyWrappersAsStructs_Previews: PreviewProvider {
    static var previews: some View {
        PropertyWrappersAsStructs()
    }
}
