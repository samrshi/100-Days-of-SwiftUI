//
//  CustomBindings.swift
//  Instafilter
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CustomBindings: View {
    // we still use @State private var here
    @State private var blurAmount: CGFloat = 0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    
    var body: some View {
        let blur = Binding<CGFloat> (
            get: {
                self.blurAmount
            },
            set: {
                self.blurAmount = $0
                print("New value is \(self.blurAmount)")
            }
        )
        
        return VStack {
            Text("Hello, World!")
                .blur(radius: blurAmount)
            // we still use the original blurAmount here
            
            Slider(value: blur, in: 0...20)
        }
    }
}

struct CustomBindings_Previews: PreviewProvider {
    static var previews: some View {
        CustomBindings()
    }
}
