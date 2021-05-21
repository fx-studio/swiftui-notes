//
//  DemoLoginViewModel.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/20/21.
//

import Foundation
import SwiftUI

class DemoLoginViewModel : ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var rememberUser: Bool = false
    
    @Published var alert: Bool = false
    @Published var isLogined: Bool = false
    @Published var message: String = ""
    
    func checkValid() -> Bool {
        return !username.isEmpty && !password.isEmpty
    }
    
    func reset() {
        username = ""
        password = ""
    }
    
    func login() {
        if username == "admin" && password == "123" {
            alert = true
            isLogined = true
            message = "Login successful."
        } else {
            alert = true
            isLogined = false
            message = "Username or password is incorrect."
        }
    }
    
}
