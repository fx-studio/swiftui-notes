//
//  DemoReferenceView.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import SwiftUI

struct DemoReferenceView: View {
    
    @StateObject var user = User(name: "Fx Studio", age: 18)
    
    var body: some View {
        VStack {
            Text("\(user.age) years old")
                .font(.title)
                .foregroundColor(Color.blue)
                .padding()
            UserView(user: user)
                .frame(width: 100, height: 175)
                .padding()
            HStack{
                Button(action: {
                    user.age += 1
                }, label: {
                    Text("+")
                        .font(.title)
                        .foregroundColor(Color.red)
                        .padding()
                        .background(Color(.lightGray))
                })
                Button(action: {
                    user.age -= 1
                }, label: {
                    Text("-")
                        .font(.title)
                        .foregroundColor(Color.red)
                        .padding()
                        .background(Color(.lightGray))
                })
            }
        }
    }
}

struct DemoReferenceView_Previews: PreviewProvider {
    static var previews: some View {
        DemoReferenceView()
    }
}
