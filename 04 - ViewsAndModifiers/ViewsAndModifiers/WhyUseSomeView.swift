//
//  WhyUseSomeView.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct WhyUseSomeView: View {
    var body: some View {
        Button("Hello World") {
            print(type(of: self.body))
        }
        .frame(width: 200, height: 200)
        .background(Color.red)
    }
}

struct WhyUseSomeView_Previews: PreviewProvider {
    static var previews: some View {
        WhyUseSomeView()
    }
}
