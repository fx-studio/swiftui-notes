//
//  TheNewAppApp.swift
//  TheNewApp
//
//  Created by Le Phuong Tien on 2/20/21.
//

import SwiftUI

@main
struct TheNewAppApp: App {
    
    @UIApplicationDelegateAdaptor(MyAppDelegate.self) private var appDelegate
    
    @Environment(\.scenePhase) private var scenePhase
    @State var name: String = ""
    
    init() {
        // Bla bla bla
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(name: name)
                .onOpenURL(perform: { url in
                    name = url.valueOf("name") ?? ""
                    
                    print(url.absoluteURL)
                    print(name)
                })
        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("App State : Background")
            case .inactive:
                print("App State : Inactive")
            case .active:
                print("App State : Active")
            @unknown default:
                print("App State : Unknown")
            }
        }
    }
}

extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
