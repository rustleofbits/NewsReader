//
//  ArticleDTO.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Foundation

struct Response: Decodable {
    let status: String
    let articles: [ArticleDTO]?
    
    struct ArticleDTO: Decodable {
        let title: String?
        let description: String?
        let publishedAt: String?
        let author: String?
        let urlToImage: String?
        let content: String?
        let url: String?
        
        func toModel() -> Article? {
            guard let title, let url else { return nil }
            return Article(
                title: title,
                description: description,
                publishedAt: formatISO8601Date(str: publishedAt),
                author: author,
                urlToImage: urlToImage,
                content: content,
                url: url
            )
        }
        
        func formatISO8601Date(str: String?) -> String? {
            guard let str, let date = ISO8601DateFormatter().date(from: str) else { return nil }
            let newFormatter = DateFormatter()
            newFormatter.dateFormat = "MMM d, YYYY"
            return newFormatter.string(from: date)
        }
    }
    
    func toModel() -> [Article] {
        guard let articles else { return [] }
        return articles.compactMap { $0.toModel() }
    }
}
