//
//  AddSpendViewModel.swift
//  Sharp
//
//  Created by Алексей Никулин on 15.11.2024.
//

import Foundation
import SwiftData
import SwiftUI

final class AddSpendViewModel: ObservableObject {
    @Published var title = ""
    @Published var price = 0.0
    @Published var date = Date()
    
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
        let spend = SpendModel(title: title, price: price , date: date)
        modelContext.insert(spend)
        fetchSpend()
        title = ""
        price = 0.0
        date = Date()
    }
    func deleteSpend(at offsets: IndexSet) {
        for offset in offsets {
            let spend = spends[offset]

            modelContext.delete(spend)
            fetchSpend()
        }
    }
    
}

