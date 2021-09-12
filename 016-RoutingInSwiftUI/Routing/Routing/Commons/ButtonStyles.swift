//
//  ButtonStyles.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/12/21.
//

import Foundation
import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.accentColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0)
    }
}
