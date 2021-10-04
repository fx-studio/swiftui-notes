//
//  Color.Ext.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/4/21.
//

import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
    
    static var headerBackground: Color {
        return .gray
    }
}
