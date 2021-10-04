//
//  AdaptiveGridDemo.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/1/21.
//

import SwiftUI

struct AdaptiveGridDemo: View {
    private var gridConfig = [
        GridItem(.adaptive(minimum: 50)),
        GridItem(.adaptive(minimum: 80)),
        GridItem(.adaptive(minimum: 30))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridConfig, spacing: 10) {
                ForEach((0...99), id: \.self) { index in
                    Image("img\(index % 10)")
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fill)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
}

struct AdaptiveGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        AdaptiveGridDemo()
    }
}
