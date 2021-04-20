//
//  ContentView.swift
//  DemoGameTappy00MacOS
//
//  Created by lephuongtien on 4/19/21.
//

import SwiftUI
import GameView

struct ContentView: View {
    
    var body: some View {
        VStack {
            GameView(width: 300.0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
