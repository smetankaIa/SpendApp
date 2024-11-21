//
//  Tabs.swift
//  Sharp
//
//  Created by Алексей Никулин on 15.11.2024.
//

import Foundation
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
    var view: some View {
        switch self {
        case .mains:
            MainView()
        case .shoppingList:
            ShoppingListView()
        case .addSpend:
            AddSpendView()
        case .history:
            HistoryView()
        case .profile:
            ProfileView()
        }
    }
 
}
