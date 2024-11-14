//
//  AddSpendView.swift
//  Sharp
//
//  Created by Алексей Никулин on 04.11.2024.
//

import SwiftUI
import SwiftData

struct AddSpendView: View {
    @Environment(\.modelContext) var modelContext
    @Query var spends: [SpendModel]
    @State var nameSpend = ""
    @State var priceSpend = 0.0
    var catregory = ["Vegetables/Fruits", "Milk Products", "Drinks", "Snacks",
              "Bakery", "Alcohol", "Chemical", "Meat", "Souce/Spices", "Cereals",
              "Other", "Add Your Category"]
    @State private var selectedCategory: String = "Vegetables/Fruits"
    @State private var selectedDate: Date = Date()
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            return formatter
        }()
    var body: some View {
        VStack {
            HStack {
                Text("Create Spend")
                    .font(.title)
            }
            HStack {
                Image(systemName: "basket.fill")
                    .foregroundStyle(.green)
                TextField("Name Spend", text: $nameSpend)
            }.padding()
            Divider()
            HStack {
                Image(systemName: "dollarsign.ring")
                    .foregroundStyle(.green)
                TextField("Price Spend", value: $priceSpend, format: .number)
                    .keyboardType(.decimalPad)
            }.padding()
            Divider()
            HStack {
                Image(systemName: "calendar")
                    .foregroundStyle(.green)
                DatePicker("Select a Date",
                           selection: $selectedDate,
                           displayedComponents: .date)
            }.padding()
            Divider()
            HStack {
                Image(systemName: "list.bullet")
                    .foregroundStyle(.green)
                Text("Select Category")
                Spacer()
                Picker("fruits", selection: $selectedCategory) {
                    ForEach(catregory, id: \.self) { fruit in
                        Text(fruit)
                        
                        
                    }
                }.pickerStyle(.menu)
                    .foregroundStyle(.black)
                
            }.padding()
            Divider()
            Spacer()
            Spacer()
            HStack {
                Button {
                    addSpend()
                } label: {
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .cornerRadius(15)
                        .overlay{
                            Text("Add Spend")
                                .foregroundStyle(.white)
                                .bold()
                        }
                }
            }.padding()
            Spacer()
        }
        
    }
    func addSpend() {
        let rome = SpendModel(name: "Rome")
        let florence = SpendModel(name: "Florence")
        let naples = SpendModel(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}


#Preview {
    AddSpendView()
}
