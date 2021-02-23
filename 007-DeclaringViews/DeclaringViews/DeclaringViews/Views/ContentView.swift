//
//  ContentView.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 2/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var count = 0
    
    var body: some View {
        VStack {
            Text("Selected \(count) users.")
                //.padding()
                .font(.title)
                .foregroundColor(Color.white)
                .background(Color(.red))
                .padding()
            HStack {
                UserView(name: "User 1", count: $count)
                    .onChanged {
                        count += 999
                    }
                UserView(name: "User 2", count: $count)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
