//
//  Model.swift
//  Networking
//
//  Created by yongbeomkwak on 2022/07/10.
//

import Foundation

struct APIResponse: Codable {
    let results: [Friend]
}

struct Friend: Codable {
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
        
        var full: String{
            return self.title.capitalized + ". " + self.first.capitalized + " " + self.last.capitalized
        }
        
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
    
    let name: Name
    let email: String
    let picture: Picture
}

