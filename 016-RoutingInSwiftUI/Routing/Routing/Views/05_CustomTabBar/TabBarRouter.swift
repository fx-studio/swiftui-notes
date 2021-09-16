//
//  TabBarRouter.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/15/21.
//

import Foundation
import SwiftUI

class TabBarRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case map
    case videos
    case profile
    case plus
}
