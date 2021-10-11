//
//  MenuItem.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/9/21.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var thumbnail: String
    var photos: [PhotoItem] = []
}


extension MenuItem {
    static func dummyData() -> [MenuItem] {
        var menu1 = MenuItem(name: "Bánh", thumbnail: "img_1_0")
        menu1.photos = (0...9).map { PhotoItem(name: "img_1_\($0)") }
        
        var menu2 = MenuItem(name: "Đồ ăn", thumbnail: "img_2_0")
        menu2.photos = (0...9).map { PhotoItem(name: "img_2_\($0)") }
        
        var menu3 = MenuItem(name: "Nước uống", thumbnail: "img_3_0")
        menu3.photos = (0...9).map { PhotoItem(name: "img_3_\($0)") }
        
        return [menu1, menu2, menu3]
    }
}
