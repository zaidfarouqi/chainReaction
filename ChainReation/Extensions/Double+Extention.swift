//
//  Double+Extention.swift
//  M2App
//
//  Created by Shahzaib Iqbal Bhatti on 2/11/21.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
