//
//  TheCocktailApp.swift
//  watchOS WatchKit Extension
//
//  Created by lephuongtien on 4/26/21.
//

import SwiftUI

@main
struct TheCocktailApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
