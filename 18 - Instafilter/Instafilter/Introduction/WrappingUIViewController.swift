//
//  WrappingUIViewController.swift
//  Instafilter
//
//  Created by hawkeyeshi on 8/3/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct WrappingUIViewController: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker()
        }
    }
}

struct WrappingUIViewController_Previews: PreviewProvider {
    static var previews: some View {
        WrappingUIViewController()
    }
}
