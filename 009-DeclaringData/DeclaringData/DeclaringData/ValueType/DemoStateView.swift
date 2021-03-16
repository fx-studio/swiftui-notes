//
//  DemoStateView.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import SwiftUI

struct DemoStateView: View {
    @State var item: Score = Score()
    
    var body: some View {
        StateView(item: $item)
    }
}

struct DemoStateView_Previews: PreviewProvider {
    static var previews: some View {
        DemoStateView()
    }
}
