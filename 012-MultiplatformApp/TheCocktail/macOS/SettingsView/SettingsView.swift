//
//  SettingsView.swift
//  TheCocktail (macOS)
//
//  Created by lephuongtien on 5/5/21.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @AppStorage("isColorMode") var isColorMode: Bool = false
    
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
    
    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $isColorMode) {
                    Text("Dark Mode")
                }
            }
        }
        .frame(width: 400, height: 200, alignment: .center)
        .colorScheme(isColorMode ? .dark : .light)
        .background(isColorMode ? Color.gray : Color.white)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
