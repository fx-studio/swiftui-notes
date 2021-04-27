//
//  TheCocktailApp.swift
//  Shared
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

@main
struct TheCocktailApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            Sidebar()
            #else
            Tabbar()
            #endif
        }
    }
}
