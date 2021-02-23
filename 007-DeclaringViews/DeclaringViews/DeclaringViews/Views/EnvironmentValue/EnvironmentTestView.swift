//
//  EnvironmentTestView.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 2/22/21.
//

import SwiftUI

struct EnvironmentTestView: View {
    
    // get variable
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .background(colorScheme == .dark ? Color(.black) : Color(.white))
                .padding()
            Text("Hello again!")
                // earch element
                .environment(\.colorScheme, .light)
                .padding()
        }
        // on top
        .environment(\.colorScheme, .dark)
        //Local environment
        .font(Font.subheadline.lowercaseSmallCaps().weight(.light))
        
    }
}

struct EnvironmentTestView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentTestView()
            // change in preview
            .environment(\.colorScheme, .light)
    }
}
