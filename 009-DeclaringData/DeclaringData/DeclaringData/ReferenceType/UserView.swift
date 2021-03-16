//
//  UserView.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var user: User
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.square")
                .resizable()
                .foregroundColor(.blue)
            Text(user.name)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text("\(user.age)")
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Button(action: {
                user.age += 1
            }) {
                Text("Tap me!")
            }
        }
    }
}
