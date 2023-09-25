//
//  PhotoResponse.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import Foundation

struct PhotoResponse: Codable {
  
    let results:[Photo]?
    let total_pages : Int?
    enum CodingKeys: String, CodingKey {
        case results
        case total_pages
    }
}

struct Photo: Codable {
    
    let description: String?
    let urls: PhotoURLs?
    let user: PhotoUser?
    
    enum CodingKeys: String, CodingKey {
        
        case description
        case urls
        case user
    }
}

struct PhotoURLs: Codable {
    let raw: String?
    let full: String?
    let regular: String?
    let small: String?
    let thumb: String?
    let smallS3: String?
    
    enum CodingKeys: String, CodingKey {
        case raw
        case full
        case regular
        case small
        case thumb
        case smallS3 = "small_s3"
    }
}

struct PhotoUser: Codable {
    let name: String?
    let profile_image: PhotoURLs?
    enum CodingKeys: String, CodingKey {
        case name
        case profile_image
    }
}
 
