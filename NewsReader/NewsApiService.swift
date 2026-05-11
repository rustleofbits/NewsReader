//
//  NewsApiService.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Foundation

class NewsApiService {
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String ?? ""
    let urlString = "https://newsapi.org/v2/top-headlines"
    
    func fetchArticles() async -> [Article] {
        guard var url = URL(string: urlString) else { return [] }
        url.append(queryItems: [
            URLQueryItem(name: "country", value: "us"),
            URLQueryItem(name: "pageSize", value: "20"),
            URLQueryItem(name: "apiKey", value: apiKey)
        ])
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(Response.self, from: data)
            return decoded.toModel()
        } catch {
            return []
        }
    }
}
