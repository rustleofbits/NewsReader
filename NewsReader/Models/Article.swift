//
//  Article.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

struct Article {
    let title: String
    let description: String?
    let publishedAt: String?
    let author: String?
    let urlToImage: String?
    let content: String?
    let url: String
    
    func toSavedArticle() -> SavedArticle {
        SavedArticle(title: title, description: description, publishedAt: publishedAt, author: author, urlToImage: urlToImage, content: content, url: url)
    }
}
