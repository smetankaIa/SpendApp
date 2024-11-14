//
//  UnknownView.swift
//  Sharp
//
//  Created by Алексей Никулин on 08.11.2024.
//

import SwiftUI
import SwiftData

struct HistoryView: View {
    @Query var spends: [SpendModel]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    List {
                        ForEach(spends) { spend in
                            HStack {
                                VStack{
                                    Text(spend.name)
                                        .font(.headline)
                                    Text(spend.date.formatted(date: .long, time: .shortened))
                                        .font(.subheadline)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Spend List")
            }
            
        }
    }
}

#Preview {
    HistoryView()
}
