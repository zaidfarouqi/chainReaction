//
//  Data.swift
//  MotoryMazad
//
//  Created by ahmad saleh on 22/11/2022.
//

import Foundation

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
    
    func printData<T>(_ type: T.Type) {
#if DEBUG
        print("========== \(type.self) ============")
        print("==========  ============")
        print(String(decoding: self, as: UTF8.self))
        print("==========  ============")
#endif
    }
    
    func printData() {
#if DEBUG
        print("==========  ============")
        print(String(decoding: self, as: UTF8.self))
        print("==========  ============")
#endif
        
    }
    
}
 

extension Data {
    
    func getSizeInMB() -> String {
        let byteCount = self.count
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB] // optional: restricts the units to MB only
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(byteCount))
        return string
    }
    
    var bytes:Double  { Double(self.count) }
    var megaBytes:Double  { self.kiloBytes / 1_024  }
    var kiloBytes:Double  { Double(self.count) / 1_024 }
}

extension Data {
    var isPDF: Bool {
        guard self.count >= 1024 else { return false }
        let pdfHeader = Data(bytes: "%PDF", count: 4)
        return self.range(of: pdfHeader, options: [], in: Range(NSRange(location: 0, length: 1024))) != nil
    }
}
