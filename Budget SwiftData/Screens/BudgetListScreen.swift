//
//  BudgetListScreen.swift
//  Budget SwiftData
//
//  Created by Tlanetzi Chavez Madero on 11/03/24.
//

import SwiftUI
import SwiftData

struct BudgetListScreen: View {
    
    @Environment(\.modelContext) private var context
    @Query private var budgets: [Budget]
    
    @State private var name: String = ""
    @State private var limit: Double?
    
    private var isFormValid: Bool {
        !name.isEmptyOrWhiteSpace && limit != nil
    }
    
    private func saveBudget() {
        let budget = Budget(name: name, limit: limit!)
        context.insert(budget)
    }
    
    var body: some View {
        Form{
            Section("New Budget"){
                TextField("Name", text: $name)
                TextField("Limit", value: $limit, format: .number)
                    .keyboardType(.numberPad)
                
                Button("Save"){
                    saveBudget()
                    name = ""
                    limit = nil
                }
                .disabled(!isFormValid)
            }
            
            Section("Budgets"){
                List(budgets){ budget in
                    
                    NavigationLink(value: budget) {
                        HStack{
                            Text(budget.name)
                            Spacer()
                            Text(budget.limit, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        }
                    }
                }
            }
            
        }
        .navigationTitle("Budgets")
        .navigationDestination(for: Budget.self) { budget in
            BudgetDetailScreen(budget: budget)
        }
    }
}

#Preview {
    NavigationStack {
        BudgetListScreen()
            .modelContainer(for: Budget.self)
    }
}
