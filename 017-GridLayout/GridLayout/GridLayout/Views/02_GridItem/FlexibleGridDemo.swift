//
//  FlexibleGridDemo.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 9/29/21.
//

import SwiftUI

struct FlexibleGridDemo: View {
    
    private var gridConfig = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(minimum: 100), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
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

struct FlexibleGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        FlexibleGridDemo()
    }
}
