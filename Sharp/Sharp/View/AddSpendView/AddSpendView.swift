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
    enum Field: Hashable {
        case nameSpend
        case priceSpend
//        case category
    }
    
    @StateObject var viewModel: AddSpendViewModel
//    @State var nameSpend = ""
//    @State var priceSpend = Int()
    @State var category = ""
    @State private var selectedCategory: String = "Vegetables/Fruits"
    @State private var selectedDate: Date = Date()
    @FocusState private var focusedField: Field?
    
    var catregory = ["Vegetables/Fruits", "Milk Products", "Drinks", "Snacks",
              "Bakery", "Alcohol", "Chemical", "Meat", "Souce/Spices", "Cereals",
              "Other", "Add Your Category"]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Create Spend")
                .font(.custom("Roboto-Bold", size: 45))
                .padding()
            
            HStack {
                Image(systemName: "basket.fill")
                    .foregroundStyle(.green)
                TextField("Name Spend", text: $viewModel.title)
                    .font(.custom("Roboto-Regular", size: 18))
                    .focused($focusedField, equals: .nameSpend)
                    .onAppear {
                        
                    }
            }
            .padding()
            
            Divider()
            
            HStack {
                Image(systemName: "dollarsign.ring")
                    .foregroundStyle(.green)
                TextField("Price Spend", value: $viewModel.price, format: .number)
                    .focused($focusedField, equals: .priceSpend)
                    .font(.custom("Roboto-Regular", size: 18))
                    .keyboardType(.decimalPad)
            }
            .padding()
            
            Divider()
            
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.green)
                DatePicker("Select a Date",
                           selection: $viewModel.date,
                           displayedComponents: .date)
                .font(.custom("Roboto-Regular", size: 18))
            }
            .padding()
            
            Divider()
            
            HStack {
                Image(systemName: "list.bullet")
                    .foregroundStyle(.green)
                Text("Add Caregory")
                    .font(.custom("Roboto-Regular", size: 18))
                Spacer()
                
                TextField("Category", text: $category)
                    .font(.custom("Roboto-Regular", size: 18))
            }
            .padding()
            
            Divider()
            Spacer()
            
            }
            VStack {
                Spacer()
                Button {
                    viewModel.addSpend()
                } label: {
                    Text("Add Spend")
                        .font(.custom("Roboto-Regular", size: 18))
                        .foregroundStyle(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .clipShape(.rect(cornerRadius: 15))
                    
                }
                Spacer()
            }
            .padding()
        
        
    }
    init(modelContext: ModelContext) {
        let viewModel = AddSpendViewModel(modelContext: modelContext)
        _viewModel = StateObject(wrappedValue: viewModel)
      }

}
#Preview {
    SwiftDataViewPreview { container in
        AddSpendView(modelContext: container.mainContext)
    }
}

