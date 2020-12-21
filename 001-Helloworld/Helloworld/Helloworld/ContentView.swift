//
//  ContentView.swift
//  Helloworld
//
//  Created by Le Phuong Tien on 12/21/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Chào bạn, mình đứng đây từ chiều.")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView().previewLayout(.fixed(width: 568, height: 320))
        }
    }
}
