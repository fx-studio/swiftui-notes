//
//  ContentView.swift
//  ExtractingSubviews
//
//  Created by Le Phuong Tien on 2/19/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowAlert: Bool = false
    @State var message: String = ""
    
    var body: some View {
        HStack {
            MyView(number: 10, isShowAlert: $isShowAlert, message: $message)
            MyView(number: 10, isShowAlert: $isShowAlert, message: $message)
            MyView(number: 10, isShowAlert: $isShowAlert, message: $message)
        }
        .alert(isPresented: $isShowAlert, content: {
            Alert(title: Text("Error"),
                  message: Text(message))
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyView: View {
    
    @State var number: Int
    @Binding var isShowAlert: Bool
    @Binding var message: String
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                if number < 20 {
                    number += 1
                } else {
                    isShowAlert = true
                    message = "Maximum"
                }
                
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
                if number > 0 {
                    number -= 1
                } else {
                    isShowAlert = true
                    message = "Minimum"
                }
            }) {
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 50.0, height: 50.0)
            }
            .frame(width: 50.0, height: 50.0)
        }
    }
}
