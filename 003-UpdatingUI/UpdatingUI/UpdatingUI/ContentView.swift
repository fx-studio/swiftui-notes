//
//  ContentView.swift
//  UpdatingUI
//
//  Created by Le Phuong Tien on 2/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var number: Int = 10
    
    var body: some View {
        VStack(alignment: .center) {
                    Button(action: {
                        number += 1
                    }) {
                        Image(systemName: "arrowtriangle.up.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .foregroundColor(.red)
                    }
                    .frame(width: 50.0, height: 50.0)
                    Text("\(number)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        number -= 1
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
