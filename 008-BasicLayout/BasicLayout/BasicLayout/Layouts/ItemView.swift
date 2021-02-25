//
//  ItemView.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 2/25/21.
//

import SwiftUI

struct ItemView: View {
    
    var width: CGFloat = 200
    var height: CGFloat = 100
    var name = ""
    var backgroundColor: Color = .blue
    
    var body: some View {
        Text(name)
            .foregroundColor(Color.white)
            .frame(width: width, height: height, alignment: .center)
            .background(backgroundColor)
            .padding(.all, 1.0)
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
