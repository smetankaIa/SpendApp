//
//  Tabs.swift
//  Sharp
//
//  Created by Алексей Никулин on 15.11.2024.
//

import Foundation
import SwiftData
import SwiftUICore

enum Tabs: CaseIterable {
    case mains, shoppingList, addSpend, history, profile
    
    var icon: String {
        switch self {
        case .mains:
            "house.fill"
        case .shoppingList:
            "cart.fill"
        case .addSpend:
            "plus.circle.fill"
        case .history:
            "banknote.fill"
        case .profile:
            "person.fill"
        }
    }
    @ViewBuilder
    func view(modelContext: ModelContext) -> some View {
        switch self {
        case .mains:
            MainView()
        case .shoppingList:
            ShoppingListView()
        case .addSpend:
            AddSpendView(modelContext: modelContext)
        case .history:
            HistoryView(modelContext: modelContext)
        case .profile:
            ProfileView()
        }
    }
 
}
