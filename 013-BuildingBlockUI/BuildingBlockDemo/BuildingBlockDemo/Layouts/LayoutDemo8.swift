//
//  LayoutDemo8.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct LayoutDemo8: View {
    var body: some View {
        HStack {
            Text("A great and warm welcome to Fx Studio")
                .background(Color.red)
            Text("A great and warm welcome to Fx Studio")
                .background(Color.red)
            Text("A great and warm welcome to Fx Studio")
                .background(Color.red)

        }
        .background(Color.yellow)
        .frame(width: 300)
    }
}

struct LayoutDemo8_Previews: PreviewProvider {
    static var previews: some View {
        LayoutDemo8()
    }
}
