//
//  NavigationLinkDemo2.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/10/21.
//

import SwiftUI

struct NavigationLinkDemo2: View {
    var body: some View {
            NavigationLink(
                destination: CustomDestinationView(),
                label: {
                    Text("Detail")
                }
            )
            .font(.largeTitle)
            .navigationTitle("Detail Title")
            .navigationBarTitleDisplayMode(.inline)
        }
}

struct NavigationLinkDemo2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkDemo2()
    }
}
