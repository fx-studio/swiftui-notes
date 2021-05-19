//
//  TextFieldDemo2View.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/19/21.
//

import SwiftUI

struct TextFieldDemo2View: View {
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
    
    @StateObject var keyboardManager = FXKeyboardManager()
    
    init() {
    }
    
    var body: some View {
        VStack {
            // Username
            VStack {
                TextField("Username", text: $name) { isBegin in
                    if isBegin {
                        keyboardManager.customHeight = 50.0
                    } else {
                        keyboardManager.customHeight = 0
                    }
                    
                } onCommit: {}
                .kute()
                
                Text(name == "" ? "Please, input your name" : "Hello, \(name)!")
                    .padding()
                Divider()
            }
            
            VStack {
                HStack {
                    Text("Age")
                    TextField("Age", value: $age, formatter: TextFieldDemo2View.numberFormater) { isBegin in
                        if isBegin {
                            keyboardManager.customHeight = 100.0
                        } else {
                            keyboardManager.customHeight = 0
                        }
                        
                    } onCommit: {}
                    .kute()
                }
                
                Text(age == 0 ? "Please, input your age" : "\(age)")
                    .padding()
                Divider()
            }
            
            // Birthday
            VStack {
                HStack {
                    Text("Birthday")
                    TextField(
                        "Birthday", value: $birthday, formatter: TextFieldDemo2View.dateformater) { isBegin in
                        if isBegin {
                            keyboardManager.customHeight = 200.0
                        } else {
                            keyboardManager.customHeight = 0
                        }
                        
                    } onCommit: {}
                    .kute()
                }
                
                Text(TextFieldDemoView.dateformater.string(from: birthday))
                    .padding()
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
        //.frame(height: 400.0)
        .padding(.bottom, keyboardManager.keyboardHeight)
        .padding()
    }
}

struct TextFieldDemo2View_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldDemo2View()
    }
}
