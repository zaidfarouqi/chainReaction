 
import Foundation
import SDWebImage
import UIKit

typealias ImageManagerCompletionHandler = (_ image: UIImage?) -> Void

class ImageManager {
    
    let downloader = SDWebImageDownloader.shared
    func setImage(url: String, imageView: UIImageView , hasPlaceHolder:Bool = true, completion: @escaping ImageManagerCompletionHandler = {_ in}) {
        guard !url.isEmpty else {
            imageView.image =  ( UIImage())
            return
        }
        imageView.sd_setImage(with: URL(string: url)!, placeholderImage:  UIImage() ) { image, _, _, _ in
            if image != nil {
                completion(image)
            } else {
                completion(nil)
            }
        }
    }
  
}
