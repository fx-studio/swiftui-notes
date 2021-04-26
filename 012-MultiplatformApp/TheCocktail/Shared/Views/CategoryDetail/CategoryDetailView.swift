//
//  CategoryDetailView.swift
//  TheCocktail (iOS)
//
//  Created by lephuongtien on 4/23/21.
//

import SwiftUI

struct CategoryDetailView: View {
    
    var categoryName: String
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
    
    var body: some View {
        VStack {
            Text("Detail of \(categoryName)")
                .font(.largeTitle)
        }
        .navigationTitle(categoryName)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(categoryName: "ABC")
    }
}
