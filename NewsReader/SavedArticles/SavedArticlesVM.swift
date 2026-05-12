//
//  SavedArticlesVM.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Combine
import SwiftData

class SavedArticlesVM {
    @Published var savedUrls = Set<String>()
    
    func onSaveTap(article: Article, savedArticles: [SavedArticle], modelContext: ModelContext) {
        let savedArticle = savedArticles.first { $0.url == article.url }
        if let savedArticle {
            savedUrls.remove(article.url)
            modelContext.delete(savedArticle)
        } else {
            let newArticle = article.toSavedArticle()
            savedUrls.insert(article.url)
            modelContext.insert(newArticle)
        }
    }
    
    func fetchUrls(savedArticles: [SavedArticle]) {
        savedUrls = Set(savedArticles.map { $0.url })
    }
    
    func isSaved(article: Article) -> Bool {
        return savedUrls.contains(article.url)
    }
}
