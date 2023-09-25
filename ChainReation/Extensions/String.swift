//
//  String.swift
//  Motory - Dealer App
//
//  Created by Hasnain Kanji on 7/14/20.
//  Copyright © 2020 Next Generation Innovation. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    
    func isValidPhoneNumber() -> Bool {
        if self.hasPrefix("0") {
            return self.count == 10
        }
        else {
            return self.count == 9
        }
    }
   
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
  
    func trim() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    func getTextHeight(isBold:Bool, size:CGFloat, width:CGFloat) -> CGFloat {
        let font = isBold ? UIFont.boldSystemFont(ofSize: size) : UIFont.systemFont(ofSize: size)
        return self.height(withConstrainedWidth: width, font: font)
    }
    func getTextWidth(isBold:Bool, size:CGFloat, height:CGFloat) -> CGFloat {
        let font = isBold ? UIFont.boldSystemFont(ofSize: size) : UIFont.systemFont(ofSize: size)
        return self.width(withConstrainedHeight: height, font: font)
    }

    func firstNCharacters(_ n: Int) -> String {
           return String(prefix(n))
       }
    
    func lastTwoURLComponentsAsString() -> String? {
           // Split the string into components using "/"
           let components = self.split(separator: "/")
           
           // Check if there are at least two components
           guard components.count >= 2 else {
               return nil
           }
           
           // Get the last two components and join them as a single string
           let secondToLastComponent = String(components[components.count - 2])
           let lastComponent = String(components[components.count - 1])
           
           return "\(secondToLastComponent)/\(lastComponent)"
       }
    func base64ToImage() -> UIImage? {
        // Convert the Base64 string to Data
        if let imageData = Data(base64Encoded: self) {
            // Create an UIImage from the Data
            if let image = UIImage(data: imageData) {
                return image
            } else {
                print("Failed to create UIImage from the Base64 data.")
                return nil
            }
        } else {
            print("Failed to convert Base64 string to Data.")
            return nil
        }
    }
}
extension String{
    func stringToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    func stringToDateWithTime() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy h:mm a"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    func getMonthFromString() -> String {
        
           let monthMapping: [String: String] = [
               "1": "Jan",
               "2": "Feb",
               "3": "Mar",
               "4": "Apr",
               "5": "May",
               "6": "Jun",
               "7": "Jul",
               "8": "Aug",
               "9": "Sep",
               "10": "Oct",
               "11": "Nov",
               "12": "Dec"
           ]
//        let monthMappingAr: [String: String] = [
//            "1": "يناير",
//            "2": "فبراير",
//            "3": "مارس",
//            "4": "أبريل",
//            "5": "مايو",
//            "6": "يونيو",
//            "7": "يوليو",
//            "8": "أغسطس",
//            "9": "سبتمبر",
//            "10": "أكتوبر",
//            "11": "نوفمبر",
//            "12": "ديسمبر"
//        ]
       // if isAppEnglish(){
            return monthMapping[self] ?? ""
      //  }else{
        //    return monthMappingAr[self] ?? ""
       // }
       }
}
