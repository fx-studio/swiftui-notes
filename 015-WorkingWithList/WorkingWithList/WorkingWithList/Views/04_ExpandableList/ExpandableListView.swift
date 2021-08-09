//
//  ExpandableListView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/9/21.
//

import SwiftUI

struct ExpandableListView: View {
    
    var items = MenuItem.dummyData()
    
    var body: some View {
        List(items, children: \.subMenuItems) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text(item.name)
                        .font(.system(.title3, design: .rounded))
                        .bold()
                }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct ExpandableListView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView()
    }
}
