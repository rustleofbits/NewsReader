//
//  ArticleDetailView.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 12.05.2026.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: Article
    var body: some View {
        ScrollView {
            if let url = article.urlToImage {
                AsyncImage(url: URL(string: url)) { phase in
                    if case .success(let image) = phase {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                VStack {
                    Text(article.title)
                        .font(.title)
                        .bold()
                    Text(article.description ?? "")
                        .foregroundStyle(.gray)
                }
                Text(article.content ?? "")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                }
            }
        }
    }
}

#Preview {
    ArticleDetailView(article: Article(title: "fnjkfn", description: "flnfkjn", publishedAt: "kdfjnkf", author: "dfljnkf", urlToImage: "", content: "kdjnjkdn dkjndjnd dkjndkjnd dkjndjkdn dkjndjkn", url: ""))
}
