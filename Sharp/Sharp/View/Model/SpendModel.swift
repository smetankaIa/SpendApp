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
    var name: String
    var price: Double
    var date: Date
    
    init(name: String  = "" , price: Double = 0.0, date: Date = .now) {
        self.name = name
        self.price = price
        self.date = date
    }
}


