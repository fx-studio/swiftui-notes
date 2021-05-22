//
//  LayoutDemo2.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct LayoutDemo2: View {
    var body: some View {
        HStack {
            Text("Hello, World!")
                .background(Color.red)
            Text("Hello, World! Hello, World! Hello, World!")
                .background(Color.red)
            Text("Hello, World!")
                .background(Color.red)
        }
        .background(Color.yellow)
    }
}

struct LayoutDemo2_Previews: PreviewProvider {
    static var previews: some View {
        LayoutDemo2()
    }
}
