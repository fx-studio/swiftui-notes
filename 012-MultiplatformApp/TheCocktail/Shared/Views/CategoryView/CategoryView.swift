//
//  CategoryView.swift
//  TheCocktail (iOS)
//
//  Created by lephuongtien on 4/23/21.
//

import SwiftUI

struct CategoryView: View {
    
    var categories = Category.getCategories()
    var body: some View {
        
        NavigationView {
            List(categories) { category in
                CategoryItemView(item: category)
            }
            .frame(minWidth: 300.0)
            .navigationTitle("Categories")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
