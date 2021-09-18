//
//  RoutingApp.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/9/21.
//

import SwiftUI

@main
struct RoutingApp: App {
    
    @StateObject var appRouter = AppRouter()
    
    @ViewBuilder
    var rootView: some View {
        switch appRouter.state {
        case .tutorial:
            TutorialView()
        case .login:
            LoginView()
        case .tabbar:
            FxTabBar()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            rootView
                .environmentObject(appRouter)
        }
    }
}
