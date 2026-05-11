//
//  NewsDetail.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI

struct NewsDetail: View {
    let article: Article
    
    var body: some View {
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
                Text(article.title ?? "")
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
                        
                    } label: {
                        Image(systemName: "bookmark")
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
}

#Preview {
    NewsDetail(article: Article(id: "", title: "Test", description: "Descr", publishedAt: "14 May", author: "Hej", urlToImage: "", content: "dkjnkfn fkjnfkjnf"))
}
