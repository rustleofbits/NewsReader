//
//  SavedArticlesVM.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Combine
import SwiftData

class SavedArticlesVM {
    func deleteArticle(article: SavedArticle, modelContext: ModelContext) {
        modelContext.delete(article)
    }
}
