//
//  UIScrollView.swift
//  MotoryMazad
//
//  Created by ahmad saleh on 20/11/2022.
//

import Foundation
import UIKit

extension UIScrollView {
  func setContentInsetAndScrollIndicatorInsets(_ edgeInsets: UIEdgeInsets) {
    self.contentInset = edgeInsets
    self.scrollIndicatorInsets = edgeInsets
  }
}

