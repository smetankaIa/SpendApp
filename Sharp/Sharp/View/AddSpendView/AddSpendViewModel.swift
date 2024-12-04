//
//  AddSpendViewModel.swift
//  Sharp
//
//  Created by Алексей Никулин on 15.11.2024.
//

import Foundation
import SwiftData
import SwiftUI


@Observable
class AddSpendViewModel {
    var modelContext: ModelContext
    var spends = [SpendModel]()
    
    init(modelContext: ModelContext, spends: [SpendModel] = [SpendModel]()) {
        self.modelContext = modelContext
        self.spends = spends
        fetchSpend()
    }
    
    func fetchSpend() {
        do {
            let descriptor = FetchDescriptor<SpendModel>(sortBy: [SortDescriptor(\.title)])
            spends = try modelContext.fetch(descriptor)
        } catch {
            print("fetch failed")
        }
    }
    
    
    func addSpend() {
        let spend = SpendModel(title: "LitEnergy Гранат", price: 99 , date: Date())
        modelContext.insert(spend)
        fetchSpend()
    }
    
    
}

