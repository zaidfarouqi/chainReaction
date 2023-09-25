//
//  UICollectionView.swift
//  MedConnecta
//
//  Created by zaid farouqi on 16/08/2023.
//

import Foundation
import UIKit

extension UICollectionView {
    func scrollToTop(animated: Bool = true) {
        let topIndexPath = IndexPath(item: 0, section: 0)
        scrollToItem(at: topIndexPath, at: .top, animated: animated)
    }
    
    func scrollToBottom(animated: Bool = true) {
        let sections = self.numberOfSections
        if sections > 0 {
            let lastSection = sections - 1
            let lastItem = self.numberOfItems(inSection: lastSection) - 1
            if lastItem >= 0 {
                let bottomIndexPath = IndexPath(item: lastItem, section: lastSection)
                self.scrollToItem(at: bottomIndexPath, at: .bottom, animated: animated)
            }
        }
    }
    func scrollToIndex(_ index: Int, animated: Bool = true) {
          if index >= 0 && index < numberOfItems(inSection: 0) {
              let indexPath = IndexPath(item: index, section: 0)
              scrollToItem(at: indexPath, at: .top, animated: animated)
          }
      }
}
