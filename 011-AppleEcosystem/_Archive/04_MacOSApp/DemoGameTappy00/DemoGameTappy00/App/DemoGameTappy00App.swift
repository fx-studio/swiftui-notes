//
//  DemoGameTappy00App.swift
//  DemoGameTappy00
//
//  Created by lephuongtien on 4/5/21.
//

import SwiftUI

@main
struct DemoGameTappy00App: App {
    
    @State var isOS: Bool = false
    @State var sorting: Int = 1
    
    let defaults = UserDefaults.standard
    
    @SceneBuilder
    var body: some Scene {
                
        WindowGroup {
            ContentView()
                //.environmentObject(defaults)
        }
        .commands {
            // #1
            AppMenu(isOS: $isOS, sorting: $sorting)
            // #2
            SortingCommands(sorting: $sorting)
            
            // #3
            CommandGroup(before: CommandGroupPlacement.newItem) {
                Button("before item") {
                    print("before item")
                }
            }
            
            
            CommandGroup(after: CommandGroupPlacement.newItem) {
                Button("after item") {
                    print("after item")
                }
            }
            
            CommandGroup(replacing: CommandGroupPlacement.appInfo) {
                Button("Custom app info") {
                    // show custom app info
                }
            }
        }

    }
}


struct SortingCommands: Commands {
    @Binding var sorting: Int
    
    var body: some Commands {
        CommandMenu("Sort") {
            Picker(selection: $sorting, label: Text("Sorting")) {
                Text("Option 1").tag(1)
                Text("Option 2").tag(2)
                Text("Option 3").tag(3)
            }
        }
    }
}


struct AppMenu: Commands {
    @Binding var isOS: Bool
    @Binding var sorting: Int
    
    var body: some Commands {
        CommandMenu("First menu") {
            Button("Print message") {
                print("Hello World!")
            }.keyboardShortcut("p")
            
            Button("Print second message") {
                print("Second message!")
            }
            
            Divider()
            
            Button("Print third message") {
                print("Third message!")
            }
            
            Picker(selection: $sorting, label: Text("Filter")) {
                Text("Option 1").tag(1)
                Text("Option 2").tag(2)
                Text("Option 3").tag(3)
            }
            
            Divider()
            
            Toggle(isOn: $isOS, label: {
                Text( isOS ? "Unselect" : "Select")
            })
        }
    }
}
