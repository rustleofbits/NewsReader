//
//  SavedArticle.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftData

@Model
class SavedArticle {
    var title: String
    var descr: String?
    var publishedAt: String?
    var author: String?
    var urlToImage: String?
    var content: String?
    var url: String
    
    init(title: String, description: String?, publishedAt: String?, author: String?, urlToImage: String?, content: String?, url: String) {
        self.title = title
        self.descr = description
        self.publishedAt = publishedAt
        self.author = author
        self.urlToImage = urlToImage
        self.content = content
        self.url = url
    }
    
    func toArticle() -> Article {
        Article(title: title, description: descr, publishedAt: publishedAt, author: author, urlToImage: urlToImage, content: content, url: url)
    }
}

