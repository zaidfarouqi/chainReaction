//
//  Bundle.swift
//  Motory - Dealer App
//
//  Created by Hasnain Kanji on 7/14/20.
//  Copyright © 2020 Next Generation Innovation. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {

    public var releaseVersionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    }

    public var buildVersionNumber: String {
        return infoDictionary?["CFBundleVersion"] as? String ?? ""
    }

    var bundleID: String {
        return Bundle.main.bundleIdentifier?.lowercased() ?? ""
    }
    
    var appVersionWithBuilNumber: String {
        
        var version = "\(releaseVersionNumber) (\(buildVersionNumber))"
        guard version.isEmpty == false else {
            return "0.0"
        }
        return version
    }
    var appVersionNumber: String {
        let version = "\(releaseVersionNumber)"
        guard version.isEmpty == false else {
            return "0.0"
        }
        return version
    }
    class func setLanguage(_ language: String) {
      defer {
          object_setClass(Bundle.main, AnyLanguageBundle.self)
      }
      objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

}
 
var bundleKey: UInt8 = 0

class AnyLanguageBundle: Bundle {

  override func localizedString(forKey key: String,
                              value: String?,
                              table tableName: String?) -> String {

    guard let path = objc_getAssociatedObject(self, &bundleKey) as? String,
        let bundle = Bundle(path: path) else {
        return super.localizedString(forKey: key, value: value, table: tableName)
    }

    return bundle.localizedString(forKey: key, value: value, table: tableName)
  }
}
