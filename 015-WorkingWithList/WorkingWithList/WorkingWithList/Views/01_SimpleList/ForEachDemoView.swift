//
//  ForEachDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/4/21.
//

import SwiftUI

struct ForEachDemoView: View {
    var body: some View {
        List {
            Text("List users")
                .font(.title)
            ForEach(0..<10) { _ in
                UserCell()
            }
        }
    }
}

struct ForEachDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachDemoView()
    }
}
