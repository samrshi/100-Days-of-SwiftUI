//
//  ContentView.swift
//  BucketList
//
//  Created by hawkeyeshi on 8/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    enum LoadingState {
        case loading, success, failed
    }
    
    var body: some View {
        Text("Hello, world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
