//
//  ContentView.swift
//  BasicLayout
//
//  Created by Le Phuong Tien on 2/25/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                ItemView(width: 400, height: 200, name: "Banner")
                ItemView(width: 100, height: 100, name: "Image", backgroundColor: .gray)
            }
            HStack {
                Spacer()
                ItemView(width: 100, height: 50, name: "Like")
                Spacer()
                ItemView(width: 100, height: 50, name: "Share")
                Spacer()
                ItemView(width: 100, height: 50, name: "Comments")
                Spacer()
            }
            VStack {
                HStack {
                    ItemView(width: 50, height: 50, name: "1")
                    ItemView(width: 50, height: 50, name: "2")
                    ItemView(width: 50, height: 50, name: "3")
                    ItemView(width: 50, height: 50, name: "4")
                }
                HStack {
                    ItemView(width: 50, height: 50, name: "5")
                    ItemView(width: 50, height: 50, name: "6")
                    ItemView(width: 50, height: 50, name: "7")
                    ItemView(width: 50, height: 50, name: "8")
                }
                HStack {
                    ItemView(width: 50, height: 50, name: "9")
                    ItemView(width: 50, height: 50, name: "10")
                    ItemView(width: 50, height: 50, name: "11")
                    ItemView(width: 50, height: 50, name: "12")
                }
                HStack {
                    ItemView(width: 50, height: 50, name: "13")
                    ItemView(width: 50, height: 50, name: "14")
                    ItemView(width: 50, height: 50, name: "15")
                    ItemView(width: 50, height: 50, name: "16")
                }
                ItemView(width: 200, height: 50, name: "See more")
            }
            VStack {
                ItemView(width: 400, height: 100, name: "New feed #1")
                ItemView(width: 400, height: 200, name: "New feed #2")
                ItemView(width: 400, height: 100, name: "New feed #3")
                ItemView(width: 400, height: 500, name: "New feed #4")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
