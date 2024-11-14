//
//  ContentView.swift
//  Sharp
//
//  Created by Алексей Никулин on 01.11.2024.
//

import SwiftUI



struct CustomTabView: View {
@State private var selectedTab = 0
@State private var isShowingSheet = false
    let images = ["house.fill","cart.fill","plus.circle.fill","banknote.fill","person.fill" ]
    var body: some View {
            NavigationStack {
                switch selectedTab {
                case 0:
                    MainView()
                case 1:
                    ShoppingListView()
                case 2:
                    AddSpendView()
                case 3:
                    HistoryView()
                case 4:
                    ProfileView()
                default:
                    EmptyView()
                }
                Spacer()
                ZStack {
                    HStack(spacing: 0) {
                        ForEach(0..<images.count) { index in
                            Button(action: {
                                selectedTab = index
                            }) {
                                VStack {
                                    Rectangle()
                                        .frame(width: 45,height: 2)
                                        .foregroundColor(selectedTab == index ? .red : .clear)
                                        .padding(.horizontal)
                                    Image(systemName: images[index])
                                        .padding(3)
                                        .foregroundColor(selectedTab == index ? .red : .gray)
                                        .font(.system(size: 20 , weight: .bold))
                                   
                                    
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        Spacer()
                    }
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                }.padding(.bottom, 0)
                    .ignoresSafeArea(.all)
        }
    }
}
#Preview {
    CustomTabView()
}
