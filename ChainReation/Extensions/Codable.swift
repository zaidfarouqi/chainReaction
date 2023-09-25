////
////  extension.swift
////  MotoryMazad
////
////  Created by ahmad saleh on 14/12/2022.
////
//
import Foundation

extension KeyedDecodingContainer {
    
    
    func decodeIfPresent(_ type: NSNumber.Type, forKey key: K) throws -> Int? {
        if let intValue = try? decode(Int.self, forKey: key) {
            return intValue
        }
        else if let stringValue = try? decode(String.self, forKey: key) {
            return Int(stringValue) ?? nil
        }
        else if let doubleValue = try? decode(Double.self, forKey: key) {
            return Int(doubleValue)
        }
        else {
            return nil
        }
    }

    
    func decodeIfPresent(_ type: Int.Type, forKey key: K) throws -> Int? {
        if let intValue = try? decode(Int.self, forKey: key) {
            return intValue
        }
        else if let stringValue = try? decode(String.self, forKey: key) {
            return Int(stringValue) ?? nil
        }
        else if let doubleValue = try? decode(Double.self, forKey: key) {
            return Int(doubleValue)
        }
        else if let boolValue = try? decode(Bool.self, forKey: key) {
            return Int(boolValue ? 1 : 0)
        }

        else {
            return nil
        }
    }
    
    func decodeIfPresent(_ type: String.Type, forKey key: K) throws -> String? {
        if let stringValue = try? decode(String.self, forKey: key) {
            return stringValue
        }
        else if let intValue = try? decode(Int.self, forKey: key) {
            return String(intValue)
        }
        else {
            return nil
        }
        
    }
    
    func decodeIfPresent(_ type: Bool.Type, forKey key: K) throws -> Bool? {
        if let boolValue = try? decode(Bool.self, forKey: key) {
            return boolValue
        }
        else if let intValue = try? decode(Int.self, forKey: key) {
            return intValue == 1
        }
        else {
            return nil
        }
    }
    
    
    func decodeIfPresent(_ type: Double.Type, forKey key: K) throws -> Double? {
        if let intValue = try? decode(Double.self, forKey: key) {
            return intValue
        }
        else if let stringValue = try? decode(String.self, forKey: key) {
            return Double(stringValue) ?? nil
        }
        else if let doubleValue = try? decode(Int.self, forKey: key) {
            return Double(doubleValue)
        }
        else {
            return nil
        }
    }

    
 
 
}

 
