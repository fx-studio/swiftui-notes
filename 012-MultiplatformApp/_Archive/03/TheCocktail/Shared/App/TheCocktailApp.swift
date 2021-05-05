//
//  TheCocktailApp.swift
//  Shared
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

@main
struct TheCocktailApp: App {
    
    @AppStorage("isColorMode") var isColorMode: Bool = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    init() {
        if (UserDefaults.standard.object(forKey: "first") == nil) {
            if colorScheme == .dark {
                isColorMode = true
            } else {
                isColorMode = false
            }
            
            UserDefaults.standard.setValue(true, forKey: "first")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
            Sidebar()
                .colorScheme(isColorMode ? .dark : .light)
            #else
            Tabbar()
                .colorScheme(isColorMode ? .dark : .light)
            #endif
        }
        .commands {
            AppCommands()
        }
        
        #if os(macOS)
        Settings {
            SettingsView()
                .colorScheme(isColorMode ? .dark : .light)
        }
        #endif
    }
}
