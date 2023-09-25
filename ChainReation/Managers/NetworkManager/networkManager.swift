//
//  networkManager.swift
//  ChainReation
//
//  Created by zaid farouqi on 25/09/2023.
//

import Foundation
typealias networkManagerCompletionHandler = (Bool?,String?,Int?,Data?) -> Void

class networkManager{
    
    var request: URLRequest!
    var resultHandlerCompletion:networkManagerCompletionHandler!
    
    internal func initWithUrl(request:URLRequest,
                              resultHandlerCompletion:@escaping networkManagerCompletionHandler) {
        
        self.request = request
        self.resultHandlerCompletion = resultHandlerCompletion
        self.startRequest()
         
    }
    
    func startRequest() {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    self.resultHandlerCompletion!(false,error.localizedDescription,500, nil)
                } else {
                    self.resultHandlerCompletion!(false,"Unknown Error",0, nil)
                }
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                self.resultHandlerCompletion!(statusCode >= 200 && statusCode < 300,"",statusCode, data)

            } else {
                self.resultHandlerCompletion!(false,"Invalid HTTP Response",0, nil)

            }
        }
        
        task.resume()
    }
 
}
