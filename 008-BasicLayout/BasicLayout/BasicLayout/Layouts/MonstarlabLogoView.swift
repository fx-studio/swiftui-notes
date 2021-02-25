//
//  MonstarlabLogoView.swift
//  BasicLayout
//
//  Created by Le Phuong Tien on 2/25/21.
//

import SwiftUI

struct LogoView: View {
    let dotColor = Color(red: 83.0/255.0, green: 87.0/255.0, blue: 90.0/255.0, opacity: 1.0)
    
    var width: CGFloat = 100
    
    var body: some View {
        VStack {
            HStack {
                ItemView(width: width/5.0, height: width/5.0, backgroundColor: dotColor)
                Spacer()
                ItemView(width: width/5.0, height: width/5.0, backgroundColor: dotColor)
            }
            Spacer()
            HStack {
                ItemView(width: width/5.0, height: width/5.0, backgroundColor: dotColor)
                 Spacer()
                 ItemView(width: width/5.0, height: width/5.0, backgroundColor: dotColor)
            }
        }
        .frame(width: width, height: width)
    }
}

struct MonstarlabLogoView: View {
    
    let backgroundColor = Color(red: 1.0, green: 1.0, blue: 0.0, opacity: 1.0)
    
    var body: some View {
        HStack {
            LogoView()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct MonstarlabLogoView_Previews: PreviewProvider {
    static var previews: some View {
        MonstarlabLogoView()
            .previewDevice("iPhone 12 Pro Max")
            
    }
}
