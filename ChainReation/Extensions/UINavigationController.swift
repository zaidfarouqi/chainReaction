//
//  UINavigationController.swift
//  MotoryMazad
//
//  Created by ahmad saleh on 19/12/2022.
//

import Foundation
import UIKit


extension UINavigationController {
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = self.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
    
}
