//
//  Integer.swift
//  MotoryMazad
//
//  Created by zaid farouqi on 20/11/2022.
//

import Foundation
extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = NSLocale(localeIdentifier: "EN") as Locale?
         numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
    
    func boolValue() -> Bool {
        return self == 1
    }
}
