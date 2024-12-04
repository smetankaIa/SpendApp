//
//  SpendModel.swift
//  Sharp
//
//  Created by Алексей Никулин on 14.11.2024.
//

import Foundation
import SwiftData

@Model
class SpendModel {
    var title: String
    var price: Double
    var date: Date
    
    init(title: String  = " " , price: Double = 0.0, date: Date = .now) {
        self.title = title
        self.price = price
        self.date = date
    }
}


