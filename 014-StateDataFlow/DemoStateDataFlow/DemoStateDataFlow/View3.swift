//
//  View3.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/18/21.
//

import SwiftUI

struct View3: View {
    @State private var count: Int = 0
    
    var body: some View {
        VStack {
            Text("\(count)")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                count += 1
            }, label: {
                Text("Tap nè!")
                    .font(.title)
            })
            .padding()
            
            CounterButton(count: $count)
        }
    }
}

struct CounterButton: View {
    @Binding var count: Int
    
    var body: some View {
        Button(action: {
            count += 1
        }, label: {
            HStack(alignment: .center) {
                Text("Tap nè!")
                    .font(.title)
                Text("(\(count))")
            }
            .padding()
        })
    }
}

struct View3_Previews: PreviewProvider {
    static var previews: some View {
        View3()
    }
}
