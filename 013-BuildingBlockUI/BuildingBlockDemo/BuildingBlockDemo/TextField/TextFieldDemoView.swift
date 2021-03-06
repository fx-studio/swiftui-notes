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
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(Color.green)
                .background(Color.yellow)
                
                Spacer()
                Text(name == "" ? "Please, input your name" : "Hello, \(name)!")
                Spacer()
                Divider()
            }
            
            VStack {
                TextField("Age",
                          value: $age,
                          formatter: TextFieldDemoView.numberFormater)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .border(Color.red, width: 2)
                
                Spacer()
                Text(age == 0 ? "Please, input your age" : "\(age)")
                Spacer()
                Divider()
            }
            
            // Birthday
            VStack {
                HStack {
                    Text("Birthday")
                    TextField(
                        "Birthday",
                        value: $birthday,
                        formatter: TextFieldDemoView.dateformater)
                        //.textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .overlay(
                          RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.blue)
                        )
                        .shadow(color: Color.gray.opacity(1.0),
                                radius: 3, x: 1, y: 2)
                }
                
                
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
