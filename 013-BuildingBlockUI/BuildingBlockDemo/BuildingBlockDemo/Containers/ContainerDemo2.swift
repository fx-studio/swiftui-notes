//
//  ContainerDemo2.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/22/21.
//

import SwiftUI

struct ContainerDemo2: View {
    var body: some View {
        VStack {
            ZStack (alignment: .bottom) {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 90)
                        .foregroundColor(
                            Color(red: 84.0/255.0, green: 61.0/255.0, blue: 1).opacity(1.0))
                    Rectangle()
                        .frame(height: 90)
                        .foregroundColor(
                            Color(red: 84.0/255.0, green: 32.0/255.0, blue: 46.0/255.0).opacity(1.0))
                }
                
                Image("logo")
                    .resizable()
                    .frame(height: .infinity)
                    .scaledToFit()
                    .clipShape(Circle())
                    .padding()
                
                VStack {
                    Spacer()
                    Text("Welcome to")
                        .font(.body)
                        .foregroundColor(.white)
                    Text("Fx Studio")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .shadow(radius: 7)
                }
                .padding()
            }
            .frame(height: 180)
            Spacer()
            VStack {
                Button(action: {}, label: {
                    HStack {
                        Image(systemName: "checkmark")
                            .font(.largeTitle)
                        Text("OK")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    .kute()
                    .padding()
                    
                })
            }
            Spacer()
        }
    }
}

struct ContainerDemo2_Previews: PreviewProvider {
    static var previews: some View {
        ContainerDemo2()
    }
}
