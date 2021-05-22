//
//  ContainerDemo1.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct ContainerDemo1: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text("Welcome to Fx Studio").font(.caption)
            Text("Welcome to Fx Studio").font(.title)
            Button(action: {}, label: { Text("OK").font(.body) })
        }
    }
}

struct ContainerDemo1_Previews: PreviewProvider {
    static var previews: some View {
        ContainerDemo1()
    }
}
