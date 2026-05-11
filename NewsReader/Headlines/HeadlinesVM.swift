//
//  HeadlinesVM.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Combine

class HeadlinesVM: ObservableObject {
    private let service = NewsApiService()
    @Published var articles: [Article] = []
    
    func fetchArticles() async {
        let fetchedArticles = await service.fetchArticles()
        await MainActor.run {
            articles = fetchedArticles
        }
    }
}
