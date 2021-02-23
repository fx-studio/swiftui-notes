//
//  UserView.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 2/23/21.
//

import SwiftUI

struct UserView: View {
    
    var name: String
    @State var isSelected = false
    @Binding var count: Int
    
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.square")
                .resizable()
                .foregroundColor(.blue)
                .frame(width: 100.0, height: 100.0)
            Text(name)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(width: 100.0, height: 25.0)
            Button(action: {
                isSelected.toggle()
                
                if isSelected {
                    count += 1
                } else {
                    count -= 1
                }
                
                if let action = action {
                    action()
                }
                
            }) {
                Image(systemName: isSelected ? "checkmark.square" : "square")
                    .foregroundColor(.green)
            }
            .frame(width: 100.0, height: 25.0)
        }
        .frame(width: 100.0, height: 150.0)
    }
    
    func onChanged(action: @escaping () -> Void ) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

struct UserView_Previews: PreviewProvider {
    @State static var count = 0
    static var previews: some View {
        UserView(name: "ABCD", count: $count)
    }
}
