//
//  ProfileView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct ProfileView: View {
    //@Binding var selection: Int
    @SceneStorage("selectedTab") var selection = 3
    @EnvironmentObject var tabbarRouter: TabBarRouter
    
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
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
            .navigationBarItems(trailing:  Button(action: {
                // goto Login
                appRouter.state = .login
            }, label: {
                Text("Logout")
                    .foregroundColor(Color.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color.accentColor))
            }))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
