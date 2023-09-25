//
//  UIButton.swift
//  MedConnecta
//
//  Created by zaid farouqi on 07/08/2023.
//

import UIKit

extension UIButton{
    
    func underlineButton() {
         guard let title = self.title(for: .normal) else {
             return
         }

         let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
         let underlineAttributedString = NSAttributedString(string: title, attributes: underlineAttribute)

        self.setAttributedTitle(underlineAttributedString, for: .normal)
     }
}
