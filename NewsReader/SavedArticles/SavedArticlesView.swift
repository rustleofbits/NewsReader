//
//  SavedArticlesView.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI
import SwiftData

struct SavedArticlesView: View {
    @Query var savedArticles: [SavedArticle]
    
    var body: some View {
        List {
            ForEach(savedArticles, id: \.title) { article in
                VStack {
                    Text(article.title)
                    Text(article.descr ?? "")
                }
            }
        }
    }
}
