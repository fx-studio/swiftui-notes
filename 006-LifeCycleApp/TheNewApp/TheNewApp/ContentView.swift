//
//  ContentView.swift
//  TheNewApp
//
//  Created by Le Phuong Tien on 2/20/21.
//

import SwiftUI

struct ContentView: View {
    
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
            Text((name != "") ? name : "---")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(name: "ABC")
    }
}
