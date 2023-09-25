//
//  unsplashManager.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import Foundation
typealias unsplashManagerCompletionHandler = (Bool?,String?,PhotoResponse?) -> Void

class unsplashManager{
    
    func getCityImages(city: String,page:Int, completionHandler: @escaping unsplashManagerCompletionHandler) {

        let apiUrl = "\(NetworkConstants.unsplashUrl)?query=\(city)&page=\(page)"
        
        var request = URLRequest(url: URL(string: apiUrl)!, timeoutInterval: Double.infinity)
        request.addValue("Client-ID \(AppConstants.unsplashAccessKey)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        networkManager().initWithUrl(request: request) { isSuccess, message, statusCode, data in
            
            if isSuccess ?? false{
                guard let data = data else{
                    completionHandler(false, message,nil)
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(PhotoResponse.self, from: data)
                    completionHandler(true, "", object)
                 
                } catch {
                    completionHandler(false, message,nil)
                }
            } else {
                completionHandler(false, message,nil)
            }
        }
    }

}
