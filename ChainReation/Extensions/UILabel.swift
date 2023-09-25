//
//  UILabel.swift
//  M2App
//
//  Created by zaid farouqi on 08/06/2021.
//

import Foundation
import CoreMedia
import UIKit
 
extension UILabel {
    func underline(fromLocation : Int = 0) {
        if let textString = self.text {
          let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: fromLocation, length: textString.count))
          attributedText = attributedString
        }
    }
 }

extension UILabel {
    func calculateMaxLines() -> Int {
        let maxSize = CGSize(width: frame.size.width, height: CGFloat(Float.infinity))
        let charSize = font.lineHeight
        let text = (self.text ?? "") as NSString
        let textSize = text.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        let linesRoundedUp = Int(ceil(textSize.height/charSize))
        return linesRoundedUp
    }

    
    func getRequiredHeight(text : String) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
//        label.attributedText = attributedText
        label.sizeToFit()
        return label.frame.height

    }
  
    var isTruncated: Bool {
       frame.width < intrinsicContentSize.width
    }

    var isClipped: Bool {
        frame.height < intrinsicContentSize.height
    }
   
}
 
