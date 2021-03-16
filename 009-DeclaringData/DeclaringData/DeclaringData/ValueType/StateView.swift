//
//  StateView.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import SwiftUI

struct StateView: View {
    @Binding var item: Score
    
    var body: some View {
        Button(action: {
            item.count += 1
        }, label: {
            Text("Tap me!\n\(item.count)")
                .font(.title)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
        })
        .padding()
        .background(Color(.blue))
    }
}
