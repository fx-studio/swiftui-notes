//
//  Tabbar.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/27/21.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        // TABBAR
        TabView {
            // #1
            ListCategoriesView(title: "Cocktail")
            .tabItem {
                Label("Cocktail", systemImage: "heart.fill")
            }
            // #2
            ListCategoriesView(title: "Glass")
            .tabItem {
                Label("Glass", systemImage: "staroflife.circle")
            }
            // #3
            ListCategoriesView(title: "Alcoholic")
            .tabItem {
                Label("Alcoholic", systemImage: "atom")
            }
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
