//
//  SavedArticlesVM.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Combine
import SwiftData

class SavedArticlesVM {
    func deleteArticle(article: Article, modelContext: ModelContext, savedArticles: [SavedArticle]) {
        let savedArticle = savedArticles.first { $0.url == article.url }
        if let savedArticle {
            modelContext.delete(savedArticle)
        }
    }
}
