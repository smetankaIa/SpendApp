//
//  CategoryModel.swift
//  Sharp
//
//  Created by Алексей Никулин on 03.12.2024.
//

import Foundation
import SwiftData

@Model
class CategoryModel {
    var name: String
   
    
    init(name: String  = "") {
        self.name = name
     
    }
}

