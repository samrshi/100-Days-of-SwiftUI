//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    
    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            self.useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}

struct ConditionalModifiers_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalModifiers()
    }
}
