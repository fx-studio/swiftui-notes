//
//  LoopItemsView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/4/21.
//

import SwiftUI

struct LoopItemsView: View {
    var body: some View {
        List (0..<10) { index in
//            Image(systemName: "person.crop.square.fill")
//                .resizable()
//                .foregroundColor(Color.orange)
//                .frame(width: 50, height: 50)
//            Text("Name \(index)")
//                .font(.title)
//                .foregroundColor(Color.orange)
            UserCell()
        }
    }
}

struct LoopItemsView_Previews: PreviewProvider {
    static var previews: some View {
        LoopItemsView()
    }
}
