//
//  MyTabView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct MyTabView: View {
    //@State var selection = 0
    @SceneStorage("selectedTab") var selection = 0
    @State var name = ""
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView(name: $name)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            MapView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("Map")
                }
                .tag(1)
            VideosView()
                .tabItem {
                    Image(systemName: "video.circle.fill")
                    Text("Videos")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }
                .tag(3)
        }
        .accentColor(.green)
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}
