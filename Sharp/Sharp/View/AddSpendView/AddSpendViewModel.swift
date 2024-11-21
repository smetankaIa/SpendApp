//
//  AddSpendViewModel.swift
//  Sharp
//
//  Created by Алексей Никулин on 15.11.2024.
//

import Foundation
import SwiftData
import SwiftUI
import SwiftUICore


class AddSpendViewModel: ObservableObject {
    @Query var spends: [SpendModel]
    @Environment(\.modelContext) var modelContext
    
    
    func addSpend() {
        let rome = SpendModel(name: "Rome")
        let florence = SpendModel(name: "Florence")
        let naples = SpendModel(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func deleteSpend(_ indexSet: IndexSet) {
        for index in indexSet {
            let spend = spends[index]
            modelContext.delete(spend)
        }
        
    }
}
