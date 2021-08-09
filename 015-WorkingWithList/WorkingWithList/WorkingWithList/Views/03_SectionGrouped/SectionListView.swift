//
//  SectionListView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/7/21.
//

import SwiftUI

struct SectionListView: View {
    
    let animals = ["Báo đốm",
                   "Bọ ngựa",
                   "Cá mập",
                   "Heo rừng",
                   "Chó",
                   "Mèo",
                   "Ếch",
                   "Hổ",
                   "Rắn",
                   "Gà",
                   "Đại bàng",
                   "Khỉ"]
    
    let flowers = ["Lan",
                   "Hồng",
                   "Hướng dương",
                   "Mai",
                   "Đào",
                   "Cúc",
                   "Sen",
                   "Tulip",
                   "Sakura"]
    
    var items: [[String]] = []
    var names = ["ĐỘNG VẬT", "HOA"]
    
    init() {
        items = [animals, flowers]
    }
    
    var body: some View {
        
        List {
            ForEach(0..<items.count) { index in
                Section(header: Text(names[index])) {
                    ForEach(items[index], id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
        //.listStyle(GroupedListStyle())
        .listStyle(InsetGroupedListStyle())
        
//        List {
//            Section(header: Text("ĐỘNG VẬT")) {
//                ForEach(animals, id: \.self) { item in
//                    Text(item)
//                }
//            }
//
//            Section(header: Text("HOA")) {
//                ForEach(flowers, id: \.self) { item in
//                    Text(item)
//                }
//            }
//        }
//        .listStyle(GroupedListStyle())
        
//        List {
//            ForEach(items, id: \.self) { array in
//                ForEach(array, id: \.self) { item in
//                    Text(item)
//                }
//            }
//        }
        
//        List {
//            Text("Động vật")
//                .font(.title)
//                .fontWeight(.bold)
//            ForEach(animals, id: \.self) { item in
//                Text(item)
//            }
//
//            Text("Hoa")
//                .font(.title)
//                .fontWeight(.bold)
//            ForEach(flowers, id: \.self) { item in
//                Text(item)
//            }
//        }
    }
}

struct SectionListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionListView()
    }
}
