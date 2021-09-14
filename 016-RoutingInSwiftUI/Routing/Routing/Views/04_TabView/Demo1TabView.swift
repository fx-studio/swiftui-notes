//
//  Demo1TabView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct Demo1TabView: View {
    
    init() {
        
    }
    
    var body: some View {
        NavigationView {
            TabView {
                List {
                    ForEach(1...10, id: \.self) { index in
                        NavigationLink(destination: Text("Item #\(index)")) {
                            Text("Item #\(index)")
                        }
                    }
                }
                    .tabItem {
                        Image(systemName: "1.square.fill")
                        Text("First")
                    }
                    .badge(99)
                Text("Another Tab")
                    .tabItem {
                        Image(systemName: "2.square.fill")
                        Text("Second")
                    }
                    .badge("ahihi")
                Text("The Last Tab")
                    .tabItem {
                        Image(systemName: "3.square.fill")
                        Text("Third")
                    }
            }
            .onAppear() {
                UITabBar.appearance().barTintColor = .yellow
                //UITabBar.appearance().backgroundColor = UIColor.red
            }
            .accentColor(.yellow)
            .navigationTitle("TabView Demo")
        }
    }
}

struct Demo1TabView_Previews: PreviewProvider {
    static var previews: some View {
        Demo1TabView()
    }
}
