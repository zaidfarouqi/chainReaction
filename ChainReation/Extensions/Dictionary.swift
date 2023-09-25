//
//  Dictionary.swift
//  MotoryMazad
//
//  Created by ahmad saleh on 26/01/2023.
//

import Foundation

extension Dictionary {
   var jsonStringRepresentation: String? {
       guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                           options: [.prettyPrinted]) else {
           return nil
       }

       return String(data: theJSONData, encoding: .ascii)
   }
}
