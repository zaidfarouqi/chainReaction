//
//
//  UIColor+Additions.swift
//  Motory - Dealer App
//
//  Copyright © 2020 Next Generation Innovation. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    
    func rgb() -> (red: Int, green: Int, blue: Int, alpha: Int)? {
        
        var fRed: CGFloat = 0, fGreen: CGFloat = 0, fBlue: CGFloat = 0, fAlpha: CGFloat = 0
        
        guard self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) else {
            return nil
        }
        
        let iRed = Int(fRed * 255.0)
        let iGreen = Int(fGreen * 255.0)
        let iBlue = Int(fBlue * 255.0)
        let iAlpha = Int(fAlpha * 255.0)
        return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
    }
    
    convenience init(hex:Int) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat((hex & 0x0000FF) >> 0) / 255.0,
                  alpha: 1.0)
    }
    
    convenience init(hex:Int, alpha:CGFloat) {
        self.init(red: CGFloat((hex & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((hex & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat((hex & 0x0000FF) >> 0) / 255.0,
                  alpha: alpha)
    }
}

