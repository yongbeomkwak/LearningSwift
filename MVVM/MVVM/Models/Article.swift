//
//  Article.swift
//  MVVM
//
//  Created by yongbeomkwak on 2022/07/11.
//

import Foundation

struct ArticleList:Codable{
    let articles: [Article]
}

struct Article:Codable {
    let title: String?
    let description: String?
    
}
