//
//  Demo01GridLayout.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 9/28/21.
//

import SwiftUI

struct Demo01GridLayout: View {
    let data = (1...100).map { "Item \($0)" }

    let columns = [
        GridItem(.flexible(minimum: 80), spacing: 8),
        GridItem(.flexible(minimum: 80), spacing: 8),
        GridItem(.flexible(minimum: 80), spacing: 8)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .foregroundColor(Color.white)
                        .padding(5)
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
}

struct Demo01GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        Demo01GridLayout()
    }
}
