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
    
    @Relationship
    var transactions: [Transaction] = []
    
    init(name: String, limit: Double) {
        self.name = name
        self.limit = limit
    }
    
    func addTransaction(_ transaction: Transaction){
        // add your business logic
        self.transactions.append(transaction)
    }
}
