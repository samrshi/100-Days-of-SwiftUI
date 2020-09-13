//
//  ContentView.swift
//  BucketList
//
//  Created by hawkeyeshi on 8/14/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView().edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
