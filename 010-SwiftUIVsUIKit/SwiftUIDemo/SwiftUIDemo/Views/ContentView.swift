//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Le Phuong Tien on 3/22/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Login", destination: LoginViewControllerRepresentation()
                                .navigationTitle("Login"))
            }
            .navigationTitle("SwiftUI Demo")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.systemBackground))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
