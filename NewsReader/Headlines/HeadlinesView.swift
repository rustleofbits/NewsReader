//
//  HeadlinesView.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI
import Combine

struct HeadlinesView: View {
    @StateObject var viewModel = HeadlinesVM()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.articles) { article in
                    NewsDetail(article: article)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)
                        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                }
            }
        }
        .onAppear() {
            Task {
                await viewModel.fetchArticles()
            }
        }
    }
}

#Preview {
    HeadlinesView()
}
