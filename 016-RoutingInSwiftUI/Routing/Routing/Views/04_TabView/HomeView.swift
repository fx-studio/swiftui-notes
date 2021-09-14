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
    
    var body: some View {
        VStack {
            Text("Home")
                .font(.largeTitle)
            Divider()
            HStack {
                Button {
                    selection = 0
                } label: { Text("Tab #1")  }

                Button {
                    selection = 1
                } label: { Text("Tab #2") }
                
                Button {
                    selection = 2
                } label: { Text("Tab #3") }
                
                Button {
                    selection = 3
                } label: { Text("Tab #4") }
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
