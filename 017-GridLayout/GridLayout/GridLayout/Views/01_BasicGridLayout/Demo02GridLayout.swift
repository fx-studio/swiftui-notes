//
//  Demo02GridLayout.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 9/28/21.
//

import SwiftUI

struct Demo02GridLayout: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var gridItemLayout = [GridItem(.fixed(80), spacing: 8),
                                  GridItem(.fixed(80), spacing: 8),
                                  GridItem(.fixed(80), spacing: 8)]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: gridItemLayout, spacing: 8) {
                ForEach((0...9999), id: \.self) {
                    Image(systemName: symbols[$0 % symbols.count])
                        .font(.system(size: 30))
                        .frame(minWidth: 80, maxWidth: .infinity, maxHeight: .infinity)
                        .background(colors[$0 % colors.count])
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

struct Demo02GridLayout_Previews: PreviewProvider {
    static var previews: some View {
        Demo02GridLayout()
    }
}
