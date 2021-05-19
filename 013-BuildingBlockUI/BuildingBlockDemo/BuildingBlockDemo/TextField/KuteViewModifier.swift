//
//  KuteViewModifier.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/19/21.
//

import SwiftUI

struct KuteViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            .background(Color.clear)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 2)
                    .foregroundColor(.blue)
            )
            .shadow(color: Color.gray.opacity(1.0), radius: 3, x: 1, y: 2)
    }
}

extension View {
    func kute() -> some View {
        ModifiedContent(
            content: self,
            modifier: KuteViewModifier()
        )
    }
}
