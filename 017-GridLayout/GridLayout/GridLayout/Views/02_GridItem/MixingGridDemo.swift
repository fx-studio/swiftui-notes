//
//  MixingGridDemo.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/1/21.
//

import SwiftUI

struct MixingGridDemo: View {
    
    private var gridConfig = [
        GridItem(.fixed(150)),
        GridItem(.adaptive(minimum: 50))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridConfig, spacing: 10) {
                ForEach((0...99), id: \.self) { index in
                    Image("img\(index % 10)")
                        .resizable()
                        .frame(height: 50)
                        .scaledToFit()
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
}

struct MixingGridDemo_Previews: PreviewProvider {
    static var previews: some View {
        MixingGridDemo()
    }
}
