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
                    NewsDetail(
                        article: article,
                        isSaved: viewModel.isSaved(article: article),
                        onSaveTap: { viewModel.onSaveTap(article: $0, savedArticles: savedArticles)}
                    )
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
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
