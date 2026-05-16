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
        Group {
            if savedArticles.isEmpty {
                Text("No saved articles yet")
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(savedArticles) { savedArticle in
                            let article = savedArticle.toArticle()
                            NavigationLink(
                                destination: ArticleDetailView(
                                    article: article,
                                    isSaved: true,
                                    onSaveTap: { viewModel.onSaveTap(article: $0, savedArticles: savedArticles, modelContext: modelContext) }
                                )
                            ) {
                                NewsDetail(
                                    article: article,
                                    isSaved: true,
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
            }
        }
        .navigationTitle("Saved articles")
        .onAppear() {
            viewModel.fetchUrls(savedArticles: savedArticles)
        }
    }
}
