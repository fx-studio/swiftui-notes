//
//  UserView.swift
//  SwiftUIDemo
//
//  Created by Le Phuong Tien on 3/22/21.
//

import SwiftUI

struct UserView: View {
    typealias Action = (String) -> Void
    
    var name: String
    var action: Action?
    
    init(name: String, action: @escaping Action) {
        self.name = name
        self.action = action
    }
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.square")
                .resizable()
                .foregroundColor(.blue)
            Text(name)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Button(action: {
                print("Select: \(name)")
                if let action = action {
                    action(name)
                }
            }) {
                Text("Tap me!")
            }
        }
        .padding()
        //.navigationBarTitle("Profile", displayMode: .inline)
    }
}
