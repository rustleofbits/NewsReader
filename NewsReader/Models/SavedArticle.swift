//
//  SavedArticle.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftData

@Model
class SavedArticle {
    var title: String
    var descr: String?
    var url: String
    
    init(title: String, descr: String?, url: String) {
        self.title = title
        self.descr = descr
        self.url = url
    }
}

