//
//  HeadlinesView.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI
import Combine
import SwiftData

struct HeadlinesView: View {
    @Environment(\.modelContext) var modelContext
    @StateObject var viewModel = HeadlinesVM()
    @Query var savedArticles: [SavedArticle]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.articles, id: \.url) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        NewsDetail(
                            article: article,
                            isSaved: viewModel.isSaved(article: article),
                            onSaveTap: { viewModel.onSaveTap(article: $0, savedArticles: savedArticles)}
                        )
                    }.buttonStyle(.plain)
                }
            }
        }
        .onAppear() {
            viewModel.modelContext = modelContext
            viewModel.fetchUrls(savedArticles: savedArticles)
            Task {
                await viewModel.fetchArticles()
            }
        }
        .navigationTitle("Headlines")
    }
}

#Preview {
    HeadlinesView()
}
