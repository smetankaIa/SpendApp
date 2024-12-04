//
//  UnknownView.swift
//  Sharp
//
//  Created by Алексей Никулин on 08.11.2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @State var  viewModel: AddSpendViewModel
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.spends) { spend in
                    HStack {
                        Text(spend.title)
                            .font(.headline)
                        Text(spend.date.formatted(date: .long, time: .shortened))
                            .font(.subheadline)
                    }
                }
//                .onDelete(perform: viewModel.deleteSpend)
            }
            .navigationTitle("Spend History")
        }
    }
    init(modelContext: ModelContext) {
        let viewModel = AddSpendViewModel(modelContext: modelContext)
          _viewModel = State(initialValue: viewModel)
      }
}

#Preview {
    struct SwiftDataVie_Preview: View {
        
        let container: ModelContainer
        
        init() {
            do {
                container = try ModelContainer(for: SpendModel.self, configurations: .init())
            } catch {
                fatalError()
            }
        }
        
        var body: some View {
            HistoryView(modelContext: container.mainContext)
        }
    }
    
    return SwiftDataVie_Preview()
}
