//
//  DemoGameTappy00MacOSApp.swift
//  DemoGameTappy00MacOS
//
//  Created by lephuongtien on 4/19/21.
//

import SwiftUI

@main
struct DemoGameTappy00MacOSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            CommandGroup(replacing: CommandGroupPlacement.help) {
                EmptyView()
            }
            
            CommandGroup(replacing: CommandGroupPlacement.newItem) {
                EmptyView()
            }
            
            CommandGroup(replacing: CommandGroupPlacement.appVisibility){
                EmptyView()
            }
            
            CommandGroup(replacing: CommandGroupPlacement.importExport){
                EmptyView()
            }

        }
    }
}
