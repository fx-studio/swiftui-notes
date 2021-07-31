//
//  View9.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/31/21.
//

import SwiftUI

struct View9: View {
    @AppStorage("count") var count: Int = 0

        var body: some View {
            VStack {
                Text("\(count)")

                Button("Tappe!") {
                    count += 1
                }
            }
        }
}

struct View9_Previews: PreviewProvider {
    static var previews: some View {
        View9()
    }
}
