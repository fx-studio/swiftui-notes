//
//  User.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import Foundation

class User: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
