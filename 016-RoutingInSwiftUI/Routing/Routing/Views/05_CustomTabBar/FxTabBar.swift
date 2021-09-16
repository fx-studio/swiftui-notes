//
//  MyTabBar.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/15/21.
//

import SwiftUI

struct FxTabBar: View {
    
    @StateObject var tabbarRouter = TabBarRouter()
    @State var isShowPopUp = false
        
    @ViewBuilder var contentView: some View {
        switch tabbarRouter.currentPage {
        case .home:
            HomeView()
                .environmentObject(tabbarRouter)
        case .map:
            MapView()
                .environmentObject(tabbarRouter)
        case .videos:
            VideosView()
                .environmentObject(tabbarRouter)
        case .profile:
            ProfileView()
                .environmentObject(tabbarRouter)
        case .plus:
            EmptyView()
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                // Contents
                contentView
                Spacer()
                // Tabbar
                HStack {
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home", tabbarRouter: tabbarRouter, assignedPage: .home)
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "map.fill", tabName: "Map", tabbarRouter: tabbarRouter, assignedPage: .map)
                    FxPlusTabBarButton(width: geometry.size.width/7, height: geometry.size.width/7, systemIconName: "plus.circle.fill", tabName: "plush", action: showPopUp)
                        .offset(y: -geometry.size.height/8/2)
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "video.circle.fill", tabName: "Videos", tabbarRouter: tabbarRouter, assignedPage: .videos)
                    FxTabItem(width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profile", tabbarRouter: tabbarRouter, assignedPage: .profile)
                     
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(Color("TabBarBackground").shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
            .sheet(isPresented: $isShowPopUp) {
                // Dismiss
            } content: {
                NewPostView()
            }
        }
    }

    func showPopUp() {
        isShowPopUp = true
    }
}

struct MyTabBar_Previews: PreviewProvider {
    static var previews: some View {
        FxTabBar()
    }
}
