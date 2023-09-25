//
//  CGFloat.swift
//  MedConnecta
//
//  Created by zaid farouqi on 10/09/2023.
//

import UIKit
extension CGFloat{
    var timeStringFormatter : String {
        let format : String?
        let minutes = Int(self) / 60 % 60
        let seconds = Int(self) % 60
        if minutes < 60 {    format = "%01i:%02i"   }
        else {    format = "%01i:%02i"    }
        return String(format: format!, minutes, seconds)
    }
}
