//
//  UIApplication.swift
//  MedConnecta
//
//  Created by zaid farouqi on 24/07/2023.
//

import UIKit
import Foundation

enum deviceOrientation{
    
    case portrait
    case landscape
}

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive || $0.activationState == .foregroundInactive })
        .compactMap({$0 as? UIWindowScene})
        .first?.windows
        .filter({$0.isKeyWindow}).first?.rootViewController) -> UIViewController? {
            if let navigationController = controller as? UINavigationController {
                return topViewController(controller: navigationController.visibleViewController)
            }
            if let tabController = controller as? UITabBarController {
                if let selected = tabController.selectedViewController {
                    return topViewController(controller: selected)
                }
            }
            if let presented = controller?.presentedViewController {
                return topViewController(controller: presented)
            }
            return controller
        }
 
}
func getDeviceInterfaceOrientation() -> deviceOrientation {
    if #available(iOS 13.0, *) {
        guard let windowScene = UIApplication.shared.windows.first?.windowScene else {
            return .portrait
        }
        if windowScene.interfaceOrientation == .landscapeLeft || windowScene.interfaceOrientation == .landscapeRight{
            return .landscape
        }
        
        return .portrait
    } else {
        if UIApplication.shared.statusBarOrientation == .landscapeLeft || UIApplication.shared.statusBarOrientation == .landscapeRight{
            return .landscape
        }
        return .portrait
    }
}
extension UIApplication {
    class func isRTL() -> Bool {
        return UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft
    }

   
}
