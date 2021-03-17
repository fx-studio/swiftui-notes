//
//  ContentView.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import SwiftUI

struct ContentView: View {
    @State var item: Score = Score()
    
    var body: some View {
            Button(action: {
                item.count += 1
            }, label: {
                Text("Tap me!\n\(item.count)")
                    .font(.title)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
            })
            .padding()
            .background(Color(.blue))
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
