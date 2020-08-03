//
//  ImagePicker.swift
//  Instafilter
//
//  Created by hawkeyeshi on 8/3/20.
//  Copyright © 2020 samrshi. All rights reserved.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
