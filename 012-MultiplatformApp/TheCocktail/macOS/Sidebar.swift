//
//  Sidebar.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/23/21.
//

import SwiftUI

struct Sidebar: View {
    
    var cocktail = CategoryView()
    var glass = CategoryView()
    var alcoholic = CategoryView()
    
    var sideBar: some View {
        List {
            NavigationLink(
                destination: cocktail,
                label: {
                    Label("Cocktail", systemImage: "heart.fill")
                })
            NavigationLink(
                destination: glass,
                label: {
                    Label("Glass", systemImage: "staroflife.circle")
                })
            NavigationLink(
                destination: alcoholic,
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
