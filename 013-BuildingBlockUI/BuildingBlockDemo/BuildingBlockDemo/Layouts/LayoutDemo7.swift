//
//  LayoutDemo7.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct LayoutDemo7: View {
    var body: some View {
        HStack(spacing: 16) {
            Text("Hello")
            Text("World")
            Text("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                .layoutPriority(1)
        }
        .font(.largeTitle)
        .lineLimit(1)
    }
}

struct LayoutDemo7_Previews: PreviewProvider {
    static var previews: some View {
        LayoutDemo7()
    }
}
