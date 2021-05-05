//
//  AppCommands.swift
//  TheCocktail (macOS)
//
//  Created by lephuongtien on 5/5/21.
//

import SwiftUI

struct AppCommands: Commands {
    
    @AppStorage("isColorMode") var isColorMode: Bool = false
    
    var body: some Commands {
        CommandMenu("Theme") {
            Picker(selection: $isColorMode, label: Text("Theme mode")) {
                Text("Dark").tag(true)
                Text("Light").tag(false)
            }
            .keyboardShortcut("D", modifiers: [.command, .shift])
        }
    }
}
