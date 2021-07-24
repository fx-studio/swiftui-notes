//
//  View7.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/24/21.
//

import SwiftUI

struct View7: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.captionBackgroundColor) var backgroundColor
    
    var body: some View {
        if colorScheme == .light {
            Text("Light mode")
                .background(backgroundColor)
        } else {
            Text("Dark mode")
                .colorScheme(.light)
                .background(backgroundColor)
        }
    }
}

struct View7_Previews: PreviewProvider {
    static var previews: some View {
        View7()
            .environment(\.colorScheme, .dark)
            //.environment(\.captionBackgroundColor, .accentColor)
            .captionBackgroundColor(.blue)
    }
}

// MARK: - Custom Environment Values

// Step 1
private struct CaptionColorKey: EnvironmentKey {
    static let defaultValue = Color(.secondarySystemBackground)
}

// Step 2
extension EnvironmentValues {
    var captionBackgroundColor: Color {
        get { self[CaptionColorKey.self] }
        set { self[CaptionColorKey.self] = newValue }
    }
}

// Step 3 - Optional
extension View {
    func captionBackgroundColor(_ color: Color) -> some View {
        environment(\.captionBackgroundColor, color)
    }
}
