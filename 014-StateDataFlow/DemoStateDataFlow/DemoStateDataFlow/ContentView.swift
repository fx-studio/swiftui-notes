//
//  ContentView.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 6/1/21.
//

import SwiftUI

class Box<T> {
  var wrappedValue: T
  init(initialValue value: T) { self.wrappedValue = value }
}

struct ContentView: View {
    
//    struct State {
//        var count = Box<Int>(initialValue: 0)
//    }
    
    
    var total: Int
    @State var count: Int
    
//    var count = State<Int>(initialValue: 0)
//    var state = State()
    
    var body: some View {
        HStack {
            Button(action: {
                self.count += 1
            }, label: {
                Text("\(self.count) / \(total)")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    @State static var count: Int = 0
    
    static var previews: some View {
        ContentView(total: 10, count: count)
    }
}
