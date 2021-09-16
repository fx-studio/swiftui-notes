//
//  VideosView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct VideosView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 2
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    var body: some View {
        VStack {
            Text("Videos")
                .font(.largeTitle)
            Divider()
            HStack {
                Button {
                    selection = 0
                    tabbarRouter.currentPage = .home
                } label: { Text("Tab #1")  }

                Button {
                    selection = 1
                    tabbarRouter.currentPage = .map
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

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
