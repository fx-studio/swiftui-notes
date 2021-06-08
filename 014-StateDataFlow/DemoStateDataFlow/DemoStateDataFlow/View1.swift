//
//  View1.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 6/1/21.
//

import SwiftUI

struct View1: View {
    
    @State var count: Int
    
    var body: some View {
        VStack {
            View2(count: count)
            Divider()
            Text("View 1: \(count)")
            Divider()
            Button(action: {
                count += 1
            }, label: {
                Text("OK")
            })
        }
    }
}

struct View2: View {
    
    @State var count: Int
    
    var body: some View {
        Text("View2 : \(count)")
    }
}

struct View1_Previews: PreviewProvider {
    
    @State static var count: Int = 0
    
    static var previews: some View {
        View1(count: count)
    }
}
