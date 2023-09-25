//
//  StoryboardIdentifiable.swift
//  TamatemPlus
//
//  Created by zaid farouqi on 13/06/2023.
//

import Foundation
import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
