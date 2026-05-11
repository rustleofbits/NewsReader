//
//  ContentView.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Headlines", systemImage: "newspaper") {
                NavigationStack {
                    HeadlinesView()
                }
            }
            Tab("Saved", systemImage: "star") {
                NavigationStack {
                    SavedArticlesView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
