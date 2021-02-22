//
//  ContentView.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    

    var body: some View {
        VStack {
            Text("Hello, world!")
                .background(colorScheme == .dark ? Color(.black) : Color(.white))
                .padding()
            Text("Hello again!")
                .padding()
                .environment(\.colorScheme, .light)
        }
        .colorScheme(.dark)
        .font(Font.subheadline.lowercaseSmallCaps().weight(.light))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
