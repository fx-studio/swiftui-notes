//
//  MultiSelectRow.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct MultiSelectRow: View {
    
    var pet: Pet
    @Binding var selectedItems: Set<UUID>
    
    var isSelected: Bool {
        selectedItems.contains(pet.id)
    }
    
    var body: some View {
        HStack {
            Text(self.pet.name)
            Spacer()
            if self.isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            if self.isSelected {
                self.selectedItems.remove(self.pet.id)
            } else {
                self.selectedItems.insert(self.pet.id)
            }
        }
    }
}

