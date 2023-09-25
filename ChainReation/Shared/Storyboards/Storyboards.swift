//
//  Storyboards.swift
//  TamatemPlus
//
//  Created by zaid farouqi on 13/06/2023.
//

import Foundation
import UIKit

extension UIStoryboard {
    /// The uniform place where we state all the storyboard we have in our application
    // MARK: storyBoard named
    enum Storyboard: String {
        
        case Splash = "Splash"
        case Map = "Map"
    
    }
    
    // MARK: - Convenience Initializers
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
    
    // MARK: - Class Functions
    
    class func storyboard(_ storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.rawValue, bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation from Generics
    
    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        
        return viewController
    }
}
