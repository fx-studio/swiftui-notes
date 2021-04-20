//
//  ContentView.swift
//  DemoGameTapp00TV
//
//  Created by lephuongtien on 4/20/21.
//

import SwiftUI
import GameView

struct ContentView: View {
    var body: some View {
        ZStack {
            GameView(width: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
