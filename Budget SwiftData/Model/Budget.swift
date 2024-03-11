//
//  Budget.swift
//  Budget SwiftData
//
//  Created by Tlanetzi Chavez Madero on 11/03/24.
//

import Foundation
import SwiftData

@Model
final class Budget {
    var name: String
    var limit: Double
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
}
