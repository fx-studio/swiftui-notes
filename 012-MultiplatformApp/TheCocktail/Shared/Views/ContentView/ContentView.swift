//
//  ContentView.swift
//  Shared
//
//  Created by lephuongtien on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // NAVI
        NavigationView {
            CategoryView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
