//
//  Tabbar.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/23/21.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        // TABBAR
        TabView {
            // #1
            CategoryView()
            .tabItem {
                Label("Cocktail", systemImage: "heart.fill")
            }
            // #2
            CategoryView()
            .tabItem {
                Label("Glass", systemImage: "staroflife.circle")
            }
            // #3
            CategoryView()
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
