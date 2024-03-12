//
//  PreviewContainer.swift
//  Budget SwiftData
//
//  Created by Tlanetzi Chavez Madero on 12/03/24.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    
    do{
        let container = try ModelContainer(for: Budget.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        SampleData.budgets.enumerated().forEach{index, budget in
            container.mainContext.insert(budget)
            let transaction = Transaction(note: "Note \(index + 1)", amount: (Double(index) * 10), date: Date())
            transaction.budget = budget
            budget.addTransaction(transaction)
        }
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

struct SampleData {
    static let budgets: [Budget] = {
        return (1...5).map { Budget(name: "Budget \($0)", limit: 100 * Double($0))}
    }()
}
