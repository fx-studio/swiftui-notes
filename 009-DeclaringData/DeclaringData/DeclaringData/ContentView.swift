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
        StateView(item: $item)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
