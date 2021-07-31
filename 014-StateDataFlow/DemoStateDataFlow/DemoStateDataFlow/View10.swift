//
//  View10.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/31/21.
//

import SwiftUI

struct View10: View {
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            View10A().tag(0)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            View10B().tag(1)
                .tabItem {
                    Label("Menu", systemImage: "square.and.pencil")
                }
        }
    }
}

struct View10A: View {
    
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        VStack {
            Text("selectedTab = \(selection)")
            Button {
                selection = 1
            } label: {
                Text("change")
            }

        }
    }
}

struct View10B: View {
    
    @SceneStorage("selectedTab") var selection = 0
    
    var body: some View {
        VStack {
            Text("selectedTab = \(selection)")
            Button {
                selection = 0
            } label: {
                Text("change")
            }

        }
    }
}

struct View10_Previews: PreviewProvider {
    static var previews: some View {
        View10()
    }
}
