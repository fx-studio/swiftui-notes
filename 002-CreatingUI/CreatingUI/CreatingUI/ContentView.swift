//
//  ContentView.swift
//  CreatingUI
//
//  Created by Le Phuong Tien on 2/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                print("^")
            }) {
                Image(systemName: "arrowtriangle.up.fill")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
                    .foregroundColor(.red)
            }
            .frame(width: 50.0, height: 50.0)
            Text("0")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.blue)
                .multilineTextAlignment(.center)
                .padding(.all)
            Button(action: {
                print("v")
            }) {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
            }
            .frame(width: 50.0, height: 50.0)
        }
        .frame(width: 50.0, height: 200.0)
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
