//
//  UnknownView.swift
//  Sharp
//
//  Created by Алексей Никулин on 08.11.2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @State var viewModel: AddSpendViewModel
    var body: some View {
        NavigationStack {
            HStack {
                Text("History Spend")
                    .font(.custom("Roboto-Bold", size: 45))
                    .padding()
                Spacer()
            }
            List {
                ForEach(viewModel.spends) { spend in
                    let formattedFloat = String(format: "%.1f", spend.price)
                    VStack {
                        HStack {
                            Text(spend.title)
                                .font(.headline)
                                .font(.custom("Roboto-Regular", size: 18))
                            Spacer()
                            VStack(alignment: .trailing) {
                                Text(formattedFloat)
                                    .font(.headline)
                                    .font(.custom("Roboto-Bold", size: 18))
                                Text(spend.date.formatted(date: .numeric, time: .omitted))
                                    .font(.subheadline)
                                    .font(.custom("Roboto-Regular", size: 18))
                            }
                        }
                        
                    }
                }
                .onDelete(perform: viewModel.deleteSpend)
                }
                .overlay(Group {
                    if viewModel.spends.isEmpty {
                        VStack {
                            Text("Oops, looks like there's no data...")
                            Image(systemName: "note")
                                .font(.system(size: 150))
                        }
                    }
                })
        }
    }
    init(modelContext: ModelContext) {
        let viewModel = AddSpendViewModel(modelContext: modelContext)
          _viewModel = State(initialValue: viewModel)
      }
}

#Preview {
    SwiftDataViewPreview { container in
        HistoryView(modelContext: container.mainContext)
    }
}
