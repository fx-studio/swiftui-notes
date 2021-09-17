//
//  SideBarDemoView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/16/21.
//

import SwiftUI

struct SideBarDemoView: View {
    var body: some View {
        
        NavigationView {
            List {
                ForEach(1...10, id:\.self) { index in
                    NavigationLink(destination: Text("Master \(index)")) {
                        Text("Item \(index)")
                    }
                }
            }
            .navigationTitle("SideBar")
            .listStyle(.sidebar)
            //Text("Primary View")
            //Text("Detail View")
        }
    }
}

struct SideBarDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarDemoView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
