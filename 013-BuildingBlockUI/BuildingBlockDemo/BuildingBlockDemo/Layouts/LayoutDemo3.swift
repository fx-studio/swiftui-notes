//
//  LayoutDemo3.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct LayoutDemo3: View {
    var body: some View {
        Image("cat")
            .resizable()
            .frame(width: 100.0, height: 100.0)
    }
}

struct LayoutDemo3_Previews: PreviewProvider {
    static var previews: some View {
        LayoutDemo3()
    }
}
