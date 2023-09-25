//
//  UITableView.swift
//  MedConnecta
//
//  Created by zaid farouqi on 13/08/2023.
//

import UIKit

extension UITableView {
    func scrollToTop(animated: Bool = true) {
        let topIndexPath = IndexPath(row: 0, section: 0)
        scrollToRow(at: topIndexPath, at: .top, animated: animated)
    }
    func scrollToBottom(animated: Bool = true) {
          let sections = self.numberOfSections
          if sections > 0 {
              let lastSection = sections - 1
              let lastRow = self.numberOfRows(inSection: lastSection) - 1
              if lastRow >= 0 {
                  let bottomIndexPath = IndexPath(row: lastRow, section: lastSection)
                  self.scrollToRow(at: bottomIndexPath, at: .bottom, animated: animated)
              }
          }
      }
    func scrollToIndex(_ index: Int, animated: Bool = true) {
           if index >= 0 && index < numberOfRows(inSection: 0) {
               let indexPath = IndexPath(row: index, section: 0)
               scrollToRow(at: indexPath, at: .top, animated: animated)
           }
       }
}
