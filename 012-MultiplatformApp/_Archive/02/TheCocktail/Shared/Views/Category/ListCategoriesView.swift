//
//  ListCategoriesView.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

struct ListCategoriesView: View {
    
    var categories = Category.getCategories()
    var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        NavigationView {
            List(categories) { category in
                CategoryCell(item: category)
            }
            .frame(minWidth: 300.0)
            .navigationTitle(title)
        }
    }
}

struct ListCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        ListCategoriesView(title: "Categories")
    }
}
