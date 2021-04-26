//
//  ContentView.swift
//  Shared
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(macOS)
        Text("Hello MacOS!")
            .font(.largeTitle)
            .frame(width: 500.0, height: 300.0)
            .padding()
        #elseif os(iOS)
        Text("Hello iOS!")
            .font(.title)
            .padding()
        #else
        Text("Hello WatchOS!")
            .font(.title)
            .padding()
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
