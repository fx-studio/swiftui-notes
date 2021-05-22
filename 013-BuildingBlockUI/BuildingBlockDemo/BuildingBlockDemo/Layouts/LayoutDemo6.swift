//
//  LayoutDemo6.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct LayoutDemo6: View {
    var body: some View {
        Text("A great and warm welcome to Fx Studio")
          .background(Color.red)
          .frame(width: 100, height: 50, alignment: .center)
          .minimumScaleFactor(0.5)
          .background(Color.yellow)
    }
}

struct LayoutDemo6_Previews: PreviewProvider {
    static var previews: some View {
        LayoutDemo6()
    }
}
