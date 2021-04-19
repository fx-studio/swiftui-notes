//
//  DemoGameTappy00App.swift
//  DemoGameTappy00_WatchKIt Extension
//
//  Created by lephuongtien on 4/6/21.
//

import SwiftUI

@main
struct DemoGameTappy00App: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
