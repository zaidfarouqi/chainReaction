//
//
//  Miscellaneous.swift
//  Motory - Dealer App
//
//  Copyright © 2020 Next Generation Innovation. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var viewWidth: CGFloat { return frame.width }
    var viewHeight: CGFloat { return frame.height }
    
   
    func roundCorner(withRadis: CGFloat) {
        self.layer.cornerRadius = withRadis
        self.layer.masksToBounds = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func setBorderColor(_ color: UIColor, borderWidth: CGFloat) {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
    
    @IBInspectable
    var cornersRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
         }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
 
    func roundBottomCorners(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
    }
    func roundTopCorners(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    
    func removeFromSuperViewAsWellAsAnySubViews() {
        for view in self.subviews{
            view.removeFromSuperview()
        }
        self.removeFromSuperview()
    }
    
    func addDismissKeyboardGuesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action:    #selector(UITableView.dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboardTouchOutside() {
        self.endEditing(true)
    }
    
    func animateBorderWidth(toValue: CGFloat, duration: Double) {
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.fromValue = layer.borderWidth
        animation.toValue = toValue
        animation.duration = duration
        layer.add(animation, forKey: "Width")
        layer.borderWidth = toValue
    }

    class func fromNib(named: String? = nil) -> Self {
        let name = named ?? "\(Self.self)"
        guard
            let nib = Bundle.main.loadNibNamed(name, owner: nil, options: nil)
            else { fatalError("missing expected nib named: \(name)") }
        guard
            /// we're using `first` here because compact map chokes compiler on
            /// optimized release, so you can't use two views in one nib if you wanted to
            /// and are now looking at this
            let view = nib.first as? Self
            else { fatalError("view of type \(Self.self) not found in \(nib)") }
        return view
    }

    func allSubviewsOf<T: UIView>(type: T.Type) -> [T] {
            var subviewsOfType = [T]()
            
            for subview in subviews {
                if let subviewOfType = subview as? T {
                    subviewsOfType.append(subviewOfType)
                }
                subviewsOfType += subview.allSubviewsOf(type: T.self)
            }
            
            return subviewsOfType
        }
    
    /// Size of view.
     var size: CGSize {
        get {
            return self.frame.size
        }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }
    
    /// Width of view.
     var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }
    
    /// Height of view.
     var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }
    func dropShadow() {
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 5
        layer.masksToBounds = true
        
    }
    func addShadowAndCornerRadius(shadowOpacity: Float = 0.5) {
        self.layer.cornerRadius = self.cornersRadius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
    }
}
