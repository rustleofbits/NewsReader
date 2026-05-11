//
//  HeadlinesVM.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Combine
import SwiftData
import SwiftUI

class HeadlinesVM: ObservableObject {
    private let service = NewsApiService()
    @Published var savedUrls = Set<String>()
    @Published var articles: [Article] = []
    
    var modelContext: ModelContext?

    func fetchArticles() async {
        let fetchedArticles = await service.fetchArticles()
        await MainActor.run {
            articles = fetchedArticles
        }
    }
    
    func fetchUrls(savedArticles: [SavedArticle]) {
        savedUrls = Set(savedArticles.map { $0.url })
    }
    
    func isSaved(article: Article) -> Bool {
        savedUrls.contains(article.url)
    }
    
    func onSaveTap(article: Article, savedArticles: [SavedArticle]) {
        let savedArticle = savedArticles.first { article.url == $0.url }
        if let savedArticle {
            savedUrls.remove(savedArticle.url)
            modelContext?.delete(savedArticle)
        } else {
            let newArticle = SavedArticle(title: article.title, descr: article.description, url: article.url)
            savedUrls.insert(newArticle.url)
            modelContext?.insert(newArticle)
        }
    }
    
}
