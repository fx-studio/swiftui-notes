//
//  FixedGridDemo.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/1/21.
//

import SwiftUI

struct FixedGridDemo: View {
    private var gridConfig = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        ScrollView([.horizontal, .vertical]) {
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

struct FixedGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        FixedGridDemo()
    }
}
