//
//  Item.swift
//  OptiiOSApp
//
//  Created by Grant Matthews on 6/20/24.
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
