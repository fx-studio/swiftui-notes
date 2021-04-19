//
//  ContentView.swift
//  DemoGameTappy00
//
//  Created by lephuongtien on 4/5/21.
//

import SwiftUI
import Game

struct ContentView: View {
    var body: some View {
        GameView(width: UIScreen.screenWidth <= UIScreen.screenHeight ? UIScreen.screenWidth : UIScreen.screenHeight)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
