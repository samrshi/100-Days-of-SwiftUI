//
//  IntegratingCoreImage.swift
//  Instafilter
//
//  Created by hawkeyeshi on 8/3/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct IntegratingCoreImage: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "dogs") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(300, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            
            // convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
    }
}

struct IntegratingCoreImage_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingCoreImage()
    }
}
