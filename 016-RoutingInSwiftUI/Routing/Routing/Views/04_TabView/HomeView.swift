//
//  HomeView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct HomeView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 0
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    @Binding var name: String {
        didSet {
            print(name)
        }
    }
    
    var body: some View {
        VStack {
            Text(name)
                .font(.largeTitle)
            Divider()
            TextField("Name", text: $name)
                .padding()
            Divider()
            HStack {
                Button {
                    selection = 0
                    tabbarRouter.currentPage = .home
                    name = "Tab1"
                } label: { Text("Tab #1")  }

                Button {
                    selection = 1
                    tabbarRouter.currentPage = .map
                    name = "Tab2"
                } label: { Text("Tab #2") }
                
                Button {
                    selection = 2
                    tabbarRouter.currentPage = .videos
                } label: { Text("Tab #3") }
                
                Button {
                    selection = 3
                    tabbarRouter.currentPage = .profile
                } label: { Text("Tab #4") }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(name: .constant("name"))
    }
}
