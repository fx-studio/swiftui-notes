//
//  Sidebar.swift
//  TheCocktail (macOS)
//
//  Created by lephuongtien on 4/27/21.
//

import SwiftUI

struct Sidebar: View {
    
    var sideBar: some View {
        List {
            NavigationLink(
                destination: ListCategoriesView(title: "Cocktail"),
                label: {
                    Label("Cocktail", systemImage: "heart.fill")
                })
            NavigationLink(
                destination: ListCategoriesView(title: "Glass"),
                label: {
                    Label("Glass", systemImage: "staroflife.circle")
                })
            NavigationLink(
                destination: ListCategoriesView(title: "Alcoholic"),
                label: {
                    Label("Alcoholic", systemImage: "atom")
                })
        }
        .frame(minWidth: 200)
        .listStyle(SidebarListStyle())
        .toolbar {
          // 4
          ToolbarItem {
            Button(action: toggleSideBar) {
              Label("Toggle Sidebar", systemImage: "sidebar.left")
            }
          }
        }
    }
    
    var body: some View {
        NavigationView {
            sideBar
            Text("Welcome to The Cocktail!")
                .foregroundColor(Color.white)
                .navigationTitle("Welcome")
        }
    }
    
    func toggleSideBar() {
      NSApp.keyWindow?.firstResponder?.tryToPerform(
        #selector(NSSplitViewController.toggleSidebar), with: nil)
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}
