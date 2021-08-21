//
//  SelectionManager.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import Foundation
import SwiftUI

struct SelectionManager {
    typealias SelectionValue = UUID
    
    // property
    var allowsMultipleSelection: Bool {
        didSet {
            // remove all item when changed mode
            selections.removeAll()
        }
    }
    var selections = Set<UUID>()
    
    // function
    init(allowsMultipleSelection: Bool = true) {
        self.allowsMultipleSelection = true
    }
    
    // select
    mutating func select(_ value: UUID) {
        if !allowsMultipleSelection {
            selections.removeAll()
        }
        selections.insert(value)
        print("selected: \(value)")
    }
    
    // deselected
    mutating func deselect(_ value: UUID) {
        selections.remove(value)
        print("deselected: \(value)")
    }
    
    func isSelected(_ value: UUID) -> Bool {
        return selections.contains(value)
    }
    
    // reset
    mutating func reset() {
        selections.removeAll()
    }
    
    // toggle of item
    mutating func toggle(_ value: UUID) {
        if selections.contains(value) {
            if !allowsMultipleSelection {
                selections.removeAll()
            } else {
                selections.remove(value)
            }
        } else {
            if !allowsMultipleSelection {
                selections.removeAll()
            }
            selections.insert(value)
        }
    }
}


