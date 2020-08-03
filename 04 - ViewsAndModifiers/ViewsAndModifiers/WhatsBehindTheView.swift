//
//  WhatsBehindTheView.swift
//  ViewsAndModifiers
//
//  Created by hawkeyeshi on 8/2/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct WhatsBehindTheView: View {
    var body: some View {
        Text("Hello World")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WhatsBehindTheView_Previews: PreviewProvider {
    static var previews: some View {
        WhatsBehindTheView()
    }
}
