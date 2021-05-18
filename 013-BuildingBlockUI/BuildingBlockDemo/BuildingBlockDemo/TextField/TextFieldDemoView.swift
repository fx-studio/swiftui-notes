//
//  TextFieldDemoView.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/18/21.
//

import SwiftUI

struct TextFieldDemoView: View {
    
    @State var name: String = ""
    @State var birthday: Date = Date()
    @State var age: Int = 0
    
    static var dateformater: DateFormatter {
        let df = DateFormatter()
        df.dateStyle = .short
        return df
    }
    
    static var numberFormater: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }
    
    
    var body: some View {
        VStack {
            // Username
            VStack {
                TextField("Username", text: $name) { isBegin in
                    if isBegin {
                        print("Begins editing")
                    } else {
                        print("Finishes editing")
                    }
                } onCommit: {
                    print("commit")
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                Text(name == "" ? "Please, input your name" : "Hello, \(name)!")
                Spacer()
                Divider()
            }
            
            VStack {
                TextField("Age",
                          value: $age,
                          formatter: TextFieldDemoView.numberFormater)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
                Text(age == 0 ? "Please, input your age" : "\(age)")
                Spacer()
                Divider()
            }
            
            // Birthday
            VStack {
                TextField(
                    "Birthday",
                    value: $birthday,
                    formatter: TextFieldDemoView.dateformater)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Spacer()
                Text(TextFieldDemoView.dateformater.string(from: birthday))
                Spacer()
                Divider()
            }
            
            // Button
            VStack {
                Button(action: {
                    name = ""
                    age = 0
                    birthday = Date()
                }, label: {
                    Text("Clear")
                        .foregroundColor(Color.white)
                })
                .padding()
                .background(Color.blue)
                
            }
        }
        .frame(height: 300.0)
        .padding()
    }
}

struct TextFieldDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemoView()
    }
}
