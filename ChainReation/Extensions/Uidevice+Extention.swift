//
//  Uidevice+Extention.swift
//  M2App
//
//  Created by Shahzaib Iqbal Bhatti on 4/16/21.
//

import Foundation
import UIKit

extension UIDevice {
    @available(iOS 11.0, *)
    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
