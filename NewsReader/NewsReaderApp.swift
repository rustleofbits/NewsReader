//
//  NewsReaderApp.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI
import SwiftData

@main
struct NewsReaderApp: App {
    var modelContainer: ModelContainer = {
        do {
            return try ModelContainer(for: SavedArticle.self)
        } catch {
            fatalError("Couldn't create modelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(modelContainer)
    }
}
