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
    @StateObject var viewModel = SavedArticlesVM()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(savedArticles) { savedArticle in
                    let article = savedArticle.toArticle()
                    NavigationLink(
                        destination: ArticleDetailView(
                            article: article,
                            isSaved: viewModel.isSaved(article: article),
                            onSaveTap: { viewModel.onSaveTap(article: $0, savedArticles: savedArticles, modelContext: modelContext) }
                        )
                    ) {
                        NewsDetail(
                            article: article,
                            isSaved: viewModel.isSaved(article: article),
                            onSaveTap: {
                                viewModel.onSaveTap(
                                    article: $0,
                                    savedArticles: savedArticles,
                                    modelContext: modelContext
                                )
                            }
                        )   
                    }.buttonStyle(.plain)
                }
            }
        }
        .navigationTitle("Saved articles")
        .onAppear() {
            Task {
                viewModel.fetchUrls(savedArticles: savedArticles)
            }
        }
    }
}
