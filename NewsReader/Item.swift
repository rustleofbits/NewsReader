//
//  Item.swift
//  NewsReader
//
//  Created by Dinara Shadyarova on 11.05.2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
