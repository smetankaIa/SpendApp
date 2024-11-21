//
//  UnknownView.swift
//  Sharp
//
//  Created by Алексей Никулин on 08.11.2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @StateObject var  viewModel = AddSpendViewModel()
    @Query var spends: [SpendModel]
   
    var body: some View {
        NavigationStack {
            List {
                ForEach(spends) { spend in
                            Text(spend.name)
                                .font(.headline)
                            Text(spend.date.formatted(date: .long, time: .shortened))
                                .font(.subheadline)
                }
                .onDelete(perform: viewModel.deleteSpend)
            }
            .navigationTitle("Spend History")
        }
    }
}

#Preview {
    HistoryView()
}
