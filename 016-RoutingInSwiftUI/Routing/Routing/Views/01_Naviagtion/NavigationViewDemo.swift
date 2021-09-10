//
//  NavigationViewDemo.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/9/21.
//

import SwiftUI

struct NavigationViewDemo: View {
    
    init() {
        UINavigationBar.appearance().backgroundColor = .yellow
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.darkGray,
            .font : UIFont(name:"Papyrus", size: 40)!]
        
        UINavigationBar.appearance().titleTextAttributes = [
            .font : UIFont(name: "HelveticaNeue-Thin", size: 20)!]
    }
    
    var body: some View {
        NavigationView {
            //Text("Hello, World!")
            List {
                Text("First")
                Text("Second")
                Text("Third")
                Text("Fourth")
                Text("Fifth")
                Text("Sixth")
                Text("Seventh")
                Text("Eighth")
                Text("Ninth")
                Text("Tenth")
            }
            .font(.largeTitle)
            .navigationTitle("List")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewDemo()
    }
}
