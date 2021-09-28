//
//  DemoCollectionView.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 9/28/21.
//

import SwiftUI

struct DemoCollectionView: View {
    
    var body: some View {
        VStack {
            ForEach(0...8, id: \.self) { indexV in
                HStack {
                    ForEach(0...3, id: \.self) { indexH in
                        Text("\(indexV*4 + indexH)")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .background(Color.accentColor)
                    }
                }
            }
        }
    }
}

struct DemoCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        DemoCollectionView()
    }
}
