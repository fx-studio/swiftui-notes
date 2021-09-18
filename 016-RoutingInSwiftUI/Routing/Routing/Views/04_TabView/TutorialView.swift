//
//  TutorialView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/14/21.
//

import SwiftUI

struct TutorialView: View {
    
    @State var selection: Int = 0
    @EnvironmentObject var appRouter: AppRouter
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
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
                .tag(0)
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
                .tag(1)
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
                .tag(2)
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .navigationBarItems(trailing: Button(action: {
                if selection < 2 {
                    selection += 1
                } else {
                    // goto Login
                    appRouter.state = .login
                }
            }, label: {
                if selection < 2 {
                    Text("Next")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color.gray))
                } else {
                    Text("Done")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color.accentColor))
                }
            }))
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
