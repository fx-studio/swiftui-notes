//
//  Category.swift
//  TheCocktail (iOS)
//
//  Created by lephuongtien on 4/26/21.
//

import Foundation
import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    var name: String
    var thumbnail: String
}

extension Category {
    static func getCategories() -> [Category] {
        let categories = ["Ordinary Drink",
                          "Cocktail",
                          "Milk / Float / Shake",
                          "Other/Unknown",
                          "Cocoa",
                          "Shot",
                          "Coffee / Tea",
                          "Homemade Liqueur",
                          "Punch / Party Drink",
                          "Beer",
                          "Soft Drink / Soda"]
        
        var items: [Category] = []
        
        for index in 0..<categories.count {
            let item = Category(name: categories[index], thumbnail: "img\(index+1)")
            items.append(item)
        }
        
        return items
    }
}
