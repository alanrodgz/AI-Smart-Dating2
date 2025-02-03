//
//  Item.swift
//  AI Smart Dating
//
//  Created by Alan Rodriguez on 2/2/25.
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
