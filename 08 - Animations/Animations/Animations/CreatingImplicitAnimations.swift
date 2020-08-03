//
//  CreatingImplicitAnimations.swift
//  Animations
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct CreatingImplicitAnimations: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        Button("Tap Me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        .animation(.default)
        .blur(radius: (animationAmount - 1) * 3)
    }
}

struct CreatingImplicitAnimations_Previews: PreviewProvider {
    static var previews: some View {
        CreatingImplicitAnimations()
    }
}
