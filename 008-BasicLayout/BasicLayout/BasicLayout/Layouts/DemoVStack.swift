//
//  DemoVStack.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 2/25/21.
//

import SwiftUI

struct DemoVStack: View {
    var body: some View {
        VStack {
            ItemView(name: "1")
            ItemView(name: "2")
            ItemView(name: "3")
            ItemView(name: "4")
        }
    }
}

struct DemoVStack_Previews: PreviewProvider {
    static var previews: some View {
        DemoVStack()
    }
}
