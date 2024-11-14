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
    var body: some Scene {
        WindowGroup {
            CustomTabView()
        }.modelContainer(for: SpendModel.self)
    }
}
