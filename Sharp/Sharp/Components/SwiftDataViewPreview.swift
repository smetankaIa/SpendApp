//
//  SwiftDataView_Preview.swift
//  Sharp
//
//  Created by Алексей Никулин on 09.12.2024.
//

import SwiftUI
import SwiftData

struct SwiftDataViewPreview<Content: View>: View {
    let container: ModelContainer
    let content: (_ container: ModelContainer) -> Content
    
    init(@ViewBuilder content: @escaping (_ container: ModelContainer) -> Content) {
        self.content = content
        
        do {
            container = try ModelContainer(for: SpendModel.self, configurations: .init())
        } catch {
            fatalError()
        }
    }
    
    var body: some View {
        content(container)
    }
}
   

#Preview {
    SwiftDataViewPreview { cont in
        Text("")
    }
}
