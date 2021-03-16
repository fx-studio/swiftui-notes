//
//  DeclaringView.swift
//  DeclaringViews
//
//  Created by Le Phuong Tien on 3/10/21.
//

import SwiftUI

struct DeclaringView: View {
    
    var body: some View {
//        FxView {
//            Text("Hello")
//        }
        FxView {
            VStack {
                Text("1")
                Text("2")
                Text("3")
            }
        }
    }
}

struct FxView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
}

struct DeclaringView_Previews: PreviewProvider {
    static var previews: some View {
        DeclaringView()
    }
}
