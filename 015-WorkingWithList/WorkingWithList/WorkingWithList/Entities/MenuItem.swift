//
//  MenuItem.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/9/21.
//

import Foundation
import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var subMenuItems: [MenuItem]?
}

extension MenuItem {
    static func dummyData() -> [MenuItem] {
        // list 1
        let list1: [MenuItem] = [MenuItem(name: "Bánh mì", image: "img_1_01"),
                                 MenuItem(name: "Bánh bao", image: "img_1_02"),
                                 MenuItem(name: "Bánh chưng", image: "img_1_03"),
                                 MenuItem(name: "Bánh quy", image: "img_1_04"),
                                 MenuItem(name: "Bánh ít lá gai", image: "img_1_05"),
                                 MenuItem(name: "Bánh bột lọc", image: "img_1_06"),
                                 MenuItem(name: "Bánh bèo", image: "img_1_07"),
                                 MenuItem(name: "Bánh đúc", image: "img_1_08"),
                                 MenuItem(name: "Bánh chuối chiên", image: "img_1_09"),
                                 MenuItem(name: "Bánh pizza", image: "img_1_10")]
        
        let sublist2: [MenuItem] = [MenuItem(name: "Cơm gà mã lai", image: "img_2_01"),
                                    MenuItem(name: "Cơm gà luộc", image: "img_2_01"),
                                    MenuItem(name: "Cơm gà xé", image: "img_2_01")]
        
        let sublist3: [MenuItem] = [MenuItem(name: "Phở bò", image: "img_2_04"),
                                    MenuItem(name: "Phở gà", image: "img_2_04"),
                                    MenuItem(name: "Phở tái", image: "img_2_04")]
        
        let list2: [MenuItem] = [MenuItem(name: "Cơm gà", image: "img_2_01", subMenuItems: sublist2),
                                 MenuItem(name: "Cơm tấm", image: "img_2_02"),
                                 MenuItem(name: "Cơm chiên dương châu", image: "img_2_03"),
                                 MenuItem(name: "Phở", image: "img_2_04", subMenuItems: sublist3),
                                 MenuItem(name: "Bún bò", image: "img_2_05"),
                                 MenuItem(name: "Bánh canh", image: "img_2_06"),
                                 MenuItem(name: "Miến xào", image: "img_2_07"),
                                 MenuItem(name: "Cháo vịt", image: "img_2_08"),
                                 MenuItem(name: "Bún chả cá", image: "img_2_09"),
                                 MenuItem(name: "Mì quảng", image: "img_2_10")]
        
        let list3: [MenuItem] = [MenuItem(name: "Trà đá", image: "img_3_01"),
                                 MenuItem(name: "Nước mía", image: "img_3_02"),
                                 MenuItem(name: "Nước chanh", image: "img_3_03"),
                                 MenuItem(name: "Coca", image: "img_3_04"),
                                 MenuItem(name: "Bia", image: "img_3_05"),
                                 MenuItem(name: "Nước ép hoa quả", image: "img_3_06"),
                                 MenuItem(name: "Sinh tố", image: "img_3_07"),
                                 MenuItem(name: "Trà sữa", image: "img_3_08"),
                                 MenuItem(name: "Chè", image: "img_3_09"),
                                 MenuItem(name: "Nước lọc", image: "img_3_10")]
        
        let items: [MenuItem] = [MenuItem(name: "Bánh", image: "img_1_01", subMenuItems: list1),
                                 MenuItem(name: "Đồ ăn", image: "img_2_01", subMenuItems: list2),
                                 MenuItem(name: "Nước uống", image: "img_3_01", subMenuItems: list3)]
        
        
        return items
    }
}
