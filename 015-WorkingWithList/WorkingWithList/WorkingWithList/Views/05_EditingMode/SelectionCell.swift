//
//  SelectionCell.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct SelectionCell: View {
    typealias Action = (String) -> Void
    
    let title: String
    @Binding var selectedItem: String?
    var action: Action?
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if title == selectedItem {
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if title == selectedItem {
                selectedItem = nil
            } else {
                self.selectedItem = self.title
            }
            
            if let action = action {
                action(title)
            }
        }
    }
}
