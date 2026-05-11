//
//  NewsDetail.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI

struct NewsDetail: View {
    let article: Article
    let isSaved: Bool
    var onSaveTap: ((Article) -> Void)?
    
    var body: some View {
        VStack {
            HStack {
                if let urlToImage = article.urlToImage {
                    AsyncImage(url: URL(string: urlToImage)) { res in
                        switch res {
                        case .empty, .failure:
                            Spacer()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(4/3, contentMode: .fill)
                                .frame(width: 150)
                                .clipped()
                        @unknown default:
                            Spacer()
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(article.title)
                        .bold()
                        .multilineTextAlignment(.leading)
                        .lineLimit(4)
                    Spacer()
                    HStack {
                        Text(article.publishedAt ?? "")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Spacer()
                        Button {
                            onSaveTap?(article)
                        } label: {
                            Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                                .foregroundStyle(.gray)
                        }
                        
                    }
                }
                .padding(.vertical)
                .padding([.trailing], 16)
                .padding([.leading], article.urlToImage == nil ? 16 : 0)
            }
            .frame(height: 200)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
        .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    NewsDetail(article: Article(title: "Test", description: "Descr", publishedAt: "14 May", author: "Hej", urlToImage: "", content: "dkjnkfn fkjnfkjnf", url: ""), isSaved: false, onSaveTap: nil)
}
