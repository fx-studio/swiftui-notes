//
//  NavigationLinkDemo1.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/10/21.
//

import SwiftUI

struct NavigationLinkDemo1: View {
    var body: some View {
        NavigationView {
            //VStack {
            //ScrollView {
            List {
                Text("No Link") // <9>
                NavigationLink(
                    destination: CustomDestinationView(), // <1>
                    label: {
                    Text("Detail") // <5>
                })
                NavigationLink(
                    destination: Text("Paper Plane"), // <2>
                    label: {
                    Image(systemName: "paperplane") // <6>
                })
                NavigationLink(
                    destination: Text("Inbox"), // <3>
                    label: {
                    Label("Inbox", systemImage: "tray") // <7>
                })
                NavigationLink(
                    destination: Text("Custom"), // <4>
                    label: {
                    HStack { // <8>
                        Image(systemName: "scribble")
                        VStack {
                            Text("Title")
                                .foregroundColor(.pink)
                            Text("Subtitle")
                        }
                    }
                })
            }
            .font(.largeTitle)
            .navigationTitle("Detail Title")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NavigationLinkDemo1_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLinkDemo1()
    }
}
