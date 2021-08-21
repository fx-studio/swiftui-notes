//
//  SuperMultiSelectRow.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct SuperMultiSelectRow : View {
    var pet: Pet
    
    @Binding var selectionManager: SelectionManager
    
    var isSelected: Bool {
        selectionManager.selections.contains(pet.id)
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
        .onTapGesture{
            self.selectionManager.toggle(self.pet.id)
        }
    }
}
