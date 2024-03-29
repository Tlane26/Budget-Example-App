//
//  Transaction.swift
//  Budget SwiftData
//
//  Created by Tlanetzi Chavez Madero on 12/03/24.
//

import Foundation
import SwiftData

@Model 
final class Transaction {
    
    var note: String
    var amount: Double
    var date: Date
    var hasReceipt: Bool
    var budget: Budget?
    
    init(note: String, amount: Double, date: Date, hasReceipt: Bool = false) {
        self.note = note
        self.amount = amount
        self.date = date
        self.hasReceipt = hasReceipt
    }
    
}
