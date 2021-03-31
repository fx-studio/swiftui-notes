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
    
    @State var redValue: Double = 0.5
    @State var blueValue: Double = 0.5
    @State var greenValue: Double = 0.5
    
    init(name: String, action: @escaping Action) {
        self.name = name
        self.action = action
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    MyAvatar(name: name, redValue: $redValue, blueValue: $blueValue, greenValue: $greenValue)

                }
                .frame(height: 350, alignment: .center)
                VStack {
                    Image(systemName: "person.crop.square")
                        .resizable()
                        .aspectRatio(1.0, contentMode: .fit)
                        .foregroundColor(Color(red: redValue, green: greenValue, blue: blueValue, opacity: 1.0))
                    Text(name)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        print("Select: \(name)")
                        if let action = action {
                            action(name)
                        }
                        redValue = Double.random(in: 0...1)
                        blueValue = Double.random(in: 0...1)
                        greenValue = Double.random(in: 0...1)
                        
                    }) {
                        Text("Tap me!")
                    }
                }
                .frame(height: 350, alignment: .center)
            }
            VStack {
                MyColorUISlider(color: .red, value: $redValue)
                    .frame(maxWidth: .infinity)
                MyColorUISlider(color: .blue, value: $blueValue)
                    .frame(maxWidth: .infinity)
                MyColorUISlider(color: .systemGreen, value: $greenValue)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
        //.navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(name: "Fx Studio", action: { _ in })
    }
}
