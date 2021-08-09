//
//  ExpandableListView2.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/9/21.
//

import SwiftUI

struct ExpandableListView2: View {
    var items = MenuItem.dummyData()
    
    var body: some View {
//        List {
//            OutlineGroup(items, children: \.subMenuItems) {  item in
//                HStack {
//                    Image(item.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//
//                    Text(item.name)
//                        .font(.system(.title3, design: .rounded))
//                        .bold()
//                }
//            }
//        }
//        .listStyle(InsetGroupedListStyle())
        
        List {
            ForEach(items) { menuItem in

                Section(header:
                            ZStack {
                                Image(menuItem.image)
                                    .resizable()
                                    .frame(width: .infinity, height: 100)
                                    .scaledToFill()

                                Text(menuItem.name)
                                    .font(.title3)
                                    .fontWeight(.heavy)
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color.black.opacity(0.5))
                            }
                            .padding(.vertical)

                ) {
                    OutlineGroup(menuItem.subMenuItems ?? [MenuItem](), children: \.subMenuItems) {  item in
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
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct ExpandableListView2_Previews: PreviewProvider {
    static var previews: some View {
        ExpandableListView2()
    }
}
