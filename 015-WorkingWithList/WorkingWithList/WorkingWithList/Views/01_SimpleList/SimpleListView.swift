//
//  SimpleListView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/4/21.
//

import SwiftUI

struct SimpleListView: View {
    var body: some View {
        List {
            Text("Item 1")
                .font(.title)
            Text("SwiftUI")
            Button(action: {
                
            }, label: {
                Text("Button")
            })
            Text("Item 4")
                .foregroundColor(Color.blue)
            Image(systemName: "globe")
                .resizable()
                .foregroundColor(Color.red)
                .frame(width: 80, height: 80)
        }
    }
}

struct SimpleListView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListView()
    }
}
