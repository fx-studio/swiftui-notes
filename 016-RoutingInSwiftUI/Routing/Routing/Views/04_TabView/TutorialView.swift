//
//  TutorialView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "chevron.left.slash.chevron.right")
                    .resizable()
                    .foregroundColor(Color.purple)
                    .frame(maxWidth: 100.0, maxHeight: 100.0)
                Text("Coding")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
            }
            VStack {
                Image(systemName: "network")
                    .resizable()
                    .foregroundColor(Color.purple)
                    .frame(maxWidth: 100.0, maxHeight: 100.0)
                Text("Sharing")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
            }
            VStack {
                Image(systemName: "heart.circle.fill")
                    .resizable()
                    .foregroundColor(Color.purple)
                    .frame(maxWidth: 100.0, maxHeight: 100.0)
                Text("Relax")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
