//
//  UIImage.swift
//  MedConnecta
//
//  Created by zaid farouqi on 29/08/2023.
//

import UIKit

extension UIImage {
    public func flippedImage() -> UIImage?{
        if let _cgImag = self.cgImage {
            let flippedimg = UIImage(cgImage: _cgImag, scale:self.scale , orientation: UIImage.Orientation.upMirrored)
            return flippedimg
        }
        return nil
    }
    func toBase64() -> String? {
            if let imageData = self.pngData() {
                return imageData.base64EncodedString(options: [])
            }
            return nil
        }
//    public func flipIfNeeded() -> UIImage? {
//        if !isAppEnglish() {
//            return self.flippedImage()
//        }
//        return self
//    }
}
