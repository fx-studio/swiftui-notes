//
//  ImageDemoView.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/14/21.
//

import SwiftUI

struct ImageDemoView: View {
    var body: some View {
//        Image(systemName: "star")
        
//        Image("cat")
//            .resizable()
//            //.scaledToFit()
//            .aspectRatio(0.7, contentMode: .fit)
//            //.frame(width: 300)
//            .ignoresSafeArea()
//            .frame(width: .infinity, height: .infinity)
            
        
//        Image("star")
//            .resizable(resizingMode: .tile)
//            .resizable(
//                capInsets: .init(
//                    top: 30,
//                    leading: 30,
//                    bottom: 30,
//                    trailing: 30
//                ),
//                resizingMode: .tile
//            )
        
//        HStack {
//            Text("Mèo dễ thương! Moa moa")
//                .font(.largeTitle)
//                .fontWeight(.heavy)
//                .foregroundColor(Color.white)
//            }
//            .background(
//                Image("cat")
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//
//            )
        
//        Image("cat")
//            .resizable()
//            .frame(width: 300, height: 300)
//            .cornerRadius(50.0)
//            .overlay(
//                Text("Mèo dễ thương")
//                    .foregroundColor(Color.white)
//                    .padding([.bottom, .trailing], 10)
//                    .opacity(0.8),
//                     alignment: .bottomTrailing
//            )
//            .background(Color.green)
//            .clipShape(Circle())
        
        VStack {
            Image(systemName: "star")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .foregroundColor(.blue)
            
            Image(systemName: "star")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .foregroundColor(.green)
            
            Image(systemName: "star")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .foregroundColor(.red)
            
            Image(systemName: "star")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .foregroundColor(.orange)
            
            Image(systemName: "star")
                .resizable()
                .frame(width: 80.0, height: 80.0)
                .foregroundColor(.yellow)
        }
        
    }
}

struct ImageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemoView()
    }
}
