//
//  SharpApp.swift
//  Sharp
//
//  Created by Алексей Никулин on 01.11.2024.
//

import SwiftUI
import SwiftData

@main
struct SharpApp: App {
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            CustomTabView(modelContext: container.mainContext)
        }.modelContainer(container)
    }
        init(){
            do {
                container = try ModelContainer(for: SpendModel.self)
            } catch {
                fatalError("Failed to create ModelContainer for SpendModel.")
        }
    }
}
