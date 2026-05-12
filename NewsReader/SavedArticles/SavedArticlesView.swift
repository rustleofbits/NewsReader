//
//  SavedArticlesView.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI
import SwiftData

struct SavedArticlesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var savedArticles: [SavedArticle]
    var viewModel = SavedArticlesVM()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(savedArticles) { savedArticle in
                    let article = savedArticle.toArticle()
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        NewsDetail(
                            article: article,
                            isSaved: true,
                            onSaveTap: {
                                viewModel.deleteArticle(
                                    article: $0,
                                    modelContext: modelContext,
                                    savedArticles: savedArticles
                                )
                            }
                        )   
                    }.buttonStyle(.plain)
                }
            }
        }
        .navigationTitle("Saved articles")
    }
}
