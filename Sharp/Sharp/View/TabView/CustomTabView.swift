//
//  ContentView.swift
//  Sharp
//
//  Created by Алексей Никулин on 01.11.2024.
//

import SwiftUI



struct CustomTabView: View {
    @State private var selectedTab: Tabs = .mains
    var body: some View {
        NavigationStack {
            selectedTab.view

                Spacer()
                    HStack(spacing: 0) {
                        ForEach(Tabs.allCases, id: \.self) { tabs in
                            Button(action: {
                                selectedTab = tabs
                            }) {
                                VStack {
                                    Rectangle()
                                        .frame(width: 45,height: 2)
                                        .foregroundColor(selectedTab == tabs ? .red : .clear)
                                        .padding(.horizontal)
                                    Image(systemName: tabs.icon)
                                        .padding(3)
                                        .foregroundColor(selectedTab == tabs ? .red : .gray)
                                        .font(.system(size: 20 , weight: .bold))
                                }
                            }
                            .frame(maxWidth: .infinity)
                        }
                        Spacer()
                    }
                    .background(Color.main)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                .ignoresSafeArea(.all)
        }
    }
}
#Preview {
    CustomTabView()
}
