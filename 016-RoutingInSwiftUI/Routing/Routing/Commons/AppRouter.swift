//
//  AppRouter.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/18/21.
//

import Foundation
import SwiftUI

class AppRouter: ObservableObject {
    @Published var state: AppState = .tutorial
}

enum AppState {
    case tutorial
    case login
    case tabbar
}
