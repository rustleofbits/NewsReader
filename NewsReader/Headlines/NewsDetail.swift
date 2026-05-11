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
            Image("Mario")
                .resizable()
                .aspectRatio(4/3, contentMode: .fill)
                .frame(width: 150)
                .clipped()
            VStack(alignment: .leading, spacing: 10) {
                Text(article.title ?? "")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                Text(article.description ?? "")
                    .foregroundStyle(.gray)
                    .lineLimit(2)
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
        }
        .frame(height: 200)
    }
}

#Preview {
    NewsDetail(article: Article(id: "", title: "Test", description: "Descr", publishedAt: "14 May", author: "Hej", urlToImage: "", content: "dkjnkfn fkjnfkjnf"))
}
