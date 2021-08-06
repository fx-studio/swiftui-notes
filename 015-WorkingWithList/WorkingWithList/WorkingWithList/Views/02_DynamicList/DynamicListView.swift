//
//  DynamicListView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/5/21.
//

import SwiftUI

struct DynamicListView: View {
    
    let cities = ["Hà Nội",
                  "Hải Phòng",
                  "Vinh",
                  "Huế",
                  "Đà Nẵng",
                  "Nha Trang",
                  "Hồ Chí Minh",
                  "Vũng Tàu"]
    
    var body: some View {
        List(cities, id: \.self) { city in
            Text(city)
        }
//        ScrollView {
//            ForEach(0..<cities.count) { index in
//                Text(cities[index])
//            }
//        }
    }
}

struct DynamicListView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicListView()
    }
}
