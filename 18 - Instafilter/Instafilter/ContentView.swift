//
//  ContentView.swift
//  Instafilter
//
//  Created by hawkeyeshi on 8/1/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?
    
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var currentFilterAsString: String = "Sepia Tone"
    
    @State private var filterIntensity = 0.5
    // challenge 3
    @State private var filterRadius = 0.5
    @State private var filterScale = 0.5
    
    @State private var showingIntensitySlider = true
    @State private var showingRadiusSlider = false
    @State private var showingScaleSlider = false
    
    
    let context = CIContext()
    
    var body: some View {
        let intensity = Binding<Double> (
            get: {
                self.filterIntensity
        },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
        }
        )
        
        // challenge 3
        let radius = Binding<Double> (
            get: {
                self.filterRadius
        },
            set: {
                self.filterRadius = $0
                self.applyProcessing()
        }
        )
        
        // challenge 3
        let scale = Binding<Double> (
            get: {
                self.filterScale
        },
            set: {
                self.filterScale = $0
                self.applyProcessing()
        }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    if image == nil {
                        Rectangle()
                            .fill(Color.secondary)
                    }
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                VStack {
                    if showingIntensitySlider {
                        HStack {
                            Text("Intensity")
                            
                            Slider(value: intensity)
                        }
                        .transition(.scale)
                    }
                    
                    if showingRadiusSlider {
                        HStack {
                            Text("Radius")
                            
                            Slider(value: radius)
                        }
                        .transition(.scale)
                    }
                    
                    if showingScaleSlider {
                        HStack {
                            Text("Scale")
                            
                            Slider(value: scale)
                        }
                        .transition(.scale)
                    }
                }
                .padding(.vertical)
                
                HStack {
                    Button(self.currentFilterAsString) {
                        self.showingFilterSheet = true 
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        if self.image == nil {
                            self.alertMessage = "You must select an image before saving"
                            self.showingAlert.toggle()
                            return
                        }
                        
                        guard let processedImage = self.processedImage else { return }
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        
                        imageSaver.errorHandler = { error in
                            self.alertMessage = error.localizedDescription
                            self.showingAlert.toggle()
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        .actionSheet(isPresented: $showingFilterSheet) {
            ActionSheet(title: Text("Select a filter"), buttons: [
                .default(Text("Pixellate")) {
                    self.setFilter(CIFilter.pixellate())
                    self.currentFilterAsString = "Pixellate"
                },
                .default(Text("Edges")) {
                    self.setFilter(CIFilter.edges())
                    self.currentFilterAsString = "Edges"
                },
                .default(Text("Guassian Blur")) {
                    self.setFilter(CIFilter.gaussianBlur())
                    self.currentFilterAsString = "Guassian Blur"
                },
                .default(Text("Sepia Tone")) {
                    self.setFilter(CIFilter.sepiaTone())
                    self.currentFilterAsString = "Sepia Tone"
                },
                .default(Text("Unsharp Mask")) {
                    self.setFilter(CIFilter.unsharpMask())
                    self.currentFilterAsString = "Unsharp Mask"
                },
                .default(Text("Vignette")) {
                    self.setFilter(CIFilter.vignette())
                    self.currentFilterAsString = "Vignette"
                },
                .cancel()
            ])
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(self.alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        
        withAnimation {
            let inputKeys = currentFilter.inputKeys
            if inputKeys.contains(kCIInputIntensityKey) {
                self.showingIntensitySlider = true
            } else {
                self.showingIntensitySlider = false
            }
            if inputKeys.contains(kCIInputRadiusKey) {
                self.showingRadiusSlider = true
            } else {
                self.showingRadiusSlider = false
            }
            if inputKeys.contains(kCIInputScaleKey) {
                self.showingScaleSlider = true
            } else {
                self.showingScaleSlider = false
            }
        }
        
        loadImage()
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterScale * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
