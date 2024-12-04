//
//  AddSpendView.swift
//  Sharp
//
//  Created by Алексей Никулин on 04.11.2024.
//

import SwiftUI
import SwiftData

enum Category: CaseIterable {
    case plants, milkProducts, drinks, snacks, bakery, alcohol, chemical, meat, souceSpices, cereals, others
    var label: String {
        switch self {
        case .plants:
            return "Plants"
        case .milkProducts:
            return "Milk Products"
        case .drinks:
            return "Drinks"
        case .snacks:
            return "Snacks"
        case .bakery:
            return "Bakery"
        case .alcohol:
            return "Alcohol"
        case .chemical:
            return "Chemicalits"
        case .meat:
            return "Meat"
        case .souceSpices:
            return "Souces / Spices"
        case .cereals:
            return "Cereals"
        case .others:
            return "Orher"
    
        }
    }
}



struct AddSpendView: View {
    @State var viewModel: AddSpendViewModel

    @State var nameSpend = ""
    @State var priceSpend = 0.0
    @State var category = ""
    @State private var selectedCategory: String = "Vegetables/Fruits"
    @State private var selectedDate: Date = Date()
    
    var catregory = ["Vegetables/Fruits", "Milk Products", "Drinks", "Snacks",
              "Bakery", "Alcohol", "Chemical", "Meat", "Souce/Spices", "Cereals",
              "Other", "Add Your Category"]
    
    var body: some View {
        VStack {
            Text("Create Spend")
                .font(.title)
    
            HStack {
                Image(systemName: "basket.fill")
                    .foregroundStyle(.green)
                TextField("Name Spend", text: $nameSpend)
            }
            .padding()
            
            Divider()
            
            HStack {
                Image(systemName: "dollarsign.ring")
                    .foregroundStyle(.green)
                TextField("Price Spend", value: $priceSpend, format: .number)
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Divider()
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.green)
                DatePicker("Select a Date",
                           selection: $selectedDate,
                           displayedComponents: .date)
            }
            .padding()
            
            Divider()
            
            HStack {
                Image(systemName: "list.bullet")
                    .foregroundStyle(.green)
                Text("Add Caregory")
                Spacer()
                
                TextField("Category", text: $category)
            }
            .padding()
            
            Divider()
            
            Spacer()
            Spacer()
            
            HStack {
                Button {
                    viewModel.addSpend()
                } label: {
                    Text("Add Spend")
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .clipShape(.rect(cornerRadius: 15))
                    
                }
            }.padding()
            Spacer()
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
            AddSpendView(modelContext: container.mainContext)
        }
    }
    
    return SwiftDataVie_Preview()
}
