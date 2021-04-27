//
//  CategoryDetailView.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

struct CategoryDetailView: View {
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        Text("Detail of \(name)")
            .navigationTitle(name)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(name: "ABC")
    }
}
