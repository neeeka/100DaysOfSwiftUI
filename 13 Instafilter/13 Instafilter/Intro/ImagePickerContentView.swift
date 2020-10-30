//
//  WrappingUIViewControllerIntoSwiftUI.swift
//  13 Instafilter
//
//  Created by Veronika Stefkova on 30/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI

class ImageSaverExample: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}

struct ImagePickerCV: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            Button("Select Image") {
                self.showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePickerExample(image: self.$inputImage)
        }
    }
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
   //     UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
        let imageSaver = ImageSaverExample()
        imageSaver.writeToPhotoAlbum(image: inputImage)
    }
}

struct ImagePickerCV_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerCV()
    }
}
