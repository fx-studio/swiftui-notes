//
//  ContentView.swift
//  DemoGameTappy00_WatchKIt Extension
//
//  Created by lephuongtien on 4/6/21.
//

import SwiftUI
import Game

struct ContentView: View {
    var body: some View {
        let temp = min(WKInterfaceDevice.screenWidth, WKInterfaceDevice.screenHeight)
        return GameView(width: temp, isWatchOS: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("Apple Watch Series 6 - 44mm")
    }
}


extension WKInterfaceDevice {
    static let screenWidth = WKInterfaceDevice.current().screenBounds.size.width
    static let screenHeight = WKInterfaceDevice.current().screenBounds.size.height
    static let screenSize = WKInterfaceDevice.current().screenBounds.size
}
