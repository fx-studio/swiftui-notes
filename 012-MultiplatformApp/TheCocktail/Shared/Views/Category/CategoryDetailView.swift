//
//  CategoryDetailView.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

struct CategoryDetailView: View {
    
    @AppStorage("isColorMode") var isColorMode: Bool = false
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        Text("Detail of \(name)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle(name)
            .colorScheme(isColorMode ? .dark : .light)
            .background(isColorMode ? Color.gray : Color.white)
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailView(name: "ABC")
    }
}
