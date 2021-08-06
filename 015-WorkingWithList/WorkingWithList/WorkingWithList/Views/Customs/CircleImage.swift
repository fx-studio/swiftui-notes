//
//  CircleImage.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/6/21.
//

import SwiftUI

struct CircleImage : View {
    var name: String
    var body: some View {
        Image(name)
            .resizable()
            .frame(height: 300)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .padding(.all)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(name: "img2")
    }
}
#endif
