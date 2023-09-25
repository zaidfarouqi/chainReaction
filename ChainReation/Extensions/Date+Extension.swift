import Foundation

public extension Date {
    
    /// User’s current calendar.
     var calendar: Calendar {
        return Calendar.current
    }
  
     var year: Int {get {return calendar.component(.year, from: self)}}
 
     var month: Int {get {return calendar.component(.month, from: self)}}
    
     var day: Int {get {return calendar.component(.day, from: self)}}
     
}


// MARK: - Methods
public extension Date {
   
    func dateString(ofStyle style: DateFormatter.Style = .medium) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = style
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
     func dateTimeString() -> String {
        let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "MMM d, yyyy - h:mm a"
         dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self)
    }
    
    func timeString() -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "h:mm" // Use the desired format
          dateFormatter.locale = Locale(identifier: "en_US_POSIX")
          return dateFormatter.string(from: self)
      }
    func timeStringAmPm() -> String {
          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "a" // Use the desired format
          dateFormatter.locale = Locale(identifier: "en_US_POSIX")
          return dateFormatter.string(from: self)
      }
    
}
 
public extension Date {
  
    func isSameDay(as otherDate: Date) -> Bool {
            let calendar = Calendar.current
            let components1 = calendar.dateComponents([.year, .month, .day], from: self)
            let components2 = calendar.dateComponents([.year, .month, .day], from: otherDate)
            
            return components1.year == components2.year &&
                components1.month == components2.month &&
                components1.day == components2.day
        }
    
}

