//
//  IntegratingCoreImage.swift
//  13 Instafilter
//
//  Created by Veronika Stefkova on 30/06/2020.
//  Copyright © 2020 Neeka. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

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
        guard let inputImage = UIImage(named: "Example") else {return}
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
 //       let currentFilter = CIFilter.sepiaTone()
 //       currentFilter.inputImage = beginImage
 //       currentFilter.intensity = 1
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(200, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        guard let outputImage = currentFilter.outputImage else {return}
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
        
        
    }
}

struct IntegratingCoreImage_Previews: PreviewProvider {
    static var previews: some View {
        IntegratingCoreImage()
    }
}
